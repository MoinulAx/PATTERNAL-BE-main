import os
import torch
import logging
from transformers import AutoModelForCausalLM, AutoTokenizer, Trainer, TrainingArguments
from datasets import load_dataset

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Set environment variable for tokenizers parallelism
os.environ["TOKENIZERS_PARALLELISM"] = "false"  # Disable tokenizer parallelism

# Set environment variable for high watermark for MPS
os.environ["PYTORCH_MPS_HIGH_WATERMARK_RATIO"] = "0.0"  
os.environ["PYTORCH_MPS_LOW_WATERMARK_RATIO"] = "0.0"     

# Load the model and tokenizer
model_name = "microsoft/DialoGPT-small"  
try:
    model = AutoModelForCausalLM.from_pretrained(model_name)
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    logger.info("Model and tokenizer loaded successfully.")
except Exception as e:
    logger.error(f"Error loading model or tokenizer: {e}")
    raise

# Set pad token to eos_token if not set
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

# Load your dataset
def tokenize_function(examples):
    tokenized_inputs = tokenizer(examples["prompt"], padding="max_length", truncation=True)
    tokenized_inputs["labels"] = tokenized_inputs["input_ids"].copy()
    return tokenized_inputs

# Load dataset
try:
    dataset = load_dataset("json", data_files="./dataset.json")
    if len(dataset["train"]) == 0:
        logger.error("The dataset is empty.")
        raise ValueError("Dataset is empty.")
    logger.info("Dataset loaded successfully.")
except Exception as e:
    logger.error(f"Error loading dataset: {e}")
    raise

# Apply tokenization
tokenized_dataset = dataset.map(tokenize_function, batched=True)

# Training Arguments
training_args = TrainingArguments(
    output_dir="./results",
    overwrite_output_dir=True,
    num_train_epochs=3,
    per_device_train_batch_size=1,  
    gradient_accumulation_steps=2,
    learning_rate=5e-5,
    max_grad_norm=1.0,
    save_steps=10_000,
    save_total_limit=2,
    logging_dir="./logs",
    logging_steps=100,
)

# Move model to available device
try:
    device = "mps" if torch.backends.mps.is_available() else "cpu"  # Fallback to CPU
    model.to(device)
    logger.info(f"Model moved to {device} successfully.")
except Exception as e:
    logger.error(f"Error moving model to device: {e}")
    raise

# Clear MPS cache before training
if device == "mps":
    torch.mps.empty_cache()

# Trainer
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_dataset["train"],
)

# Start training
try:
    trainer.train()
    logger.info("Training completed successfully.")
except Exception as e:
    logger.error(f"Training failed: {e}")
    raise

# Clear MPS cache after training (optional)
if device == "mps":
    torch.mps.empty_cache()

# Check for NaN parameters after training
for name, param in model.named_parameters():
    if torch.any(torch.isnan(param)):
        logger.warning(f"NaN found in parameter: {name}")

# Save the model
try:
    model.save_pretrained("./fine_tuned_model")
    tokenizer.save_pretrained("./fine_tuned_model")
    logger.info("Model and tokenizer saved successfully.")
except Exception as e:
    logger.error(f"Error saving model or tokenizer: {e}")
    raise
