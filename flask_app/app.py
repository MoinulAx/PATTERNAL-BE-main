from flask import Flask, request, jsonify
from transformers import AutoModelForCausalLM, AutoTokenizer
import torch
import sys
import random
import os

# Check Python version
print(sys.executable)  # Should show the path within the 'venv' directory
os.environ["TOKENIZERS_PARALLELISM"] = "false"

# Load model and tokenizer
tokenizer = AutoTokenizer.from_pretrained("microsoft/DialoGPT-medium")
model = AutoModelForCausalLM.from_pretrained("microsoft/DialoGPT-medium")

# Set the device
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)

app = Flask(__name__)

try:
    from transformers import AutoModelForCausalLM, AutoTokenizer
    import torch
    import pandas as pd
except ImportError as e:
    print(f"Import error: {e}")


fatherhood_responses = {
    "advice": [
        "Fatherhood is a transformative experience filled with growth, love, and a few challenges along the way. Take things one day at a time and remember that you don’t have to be perfect; presence and effort go a long way.",
        "Offering advice to a new father often centers on being patient and open. Embrace the small moments, as they will become treasured memories, and keep communication open with your family.",
        "If you could share a piece of advice with a new father, what would it be?"
    ],
    
    "challenges": [
        "Fatherhood brings unique challenges, especially in balancing family life with personal and professional responsibilities. Finding this balance can be tough but rewarding. Many fathers feel this struggle, and it’s okay to seek support or adjust routines as needed.",
        "The evolving needs of children require adaptability, which can sometimes feel overwhelming. It's perfectly natural to feel challenged and uncertain, but these moments foster growth in both you and your children.",
        "Reflecting on your journey, what has been the most significant challenge you’ve faced as a father?"
    ],
    
    "bonding": [
        "Bonding with your child is about being present in their lives, even in the seemingly small moments. Whether it’s reading together, playing outside, or listening attentively, these simple actions create lifelong connections.",
        "Bonding is an ongoing process that deepens through shared activities and genuine engagement. Prioritize quality over quantity, as consistent, meaningful time strengthens the parent-child relationship immensely.",
        "What activities do you find most effective for bonding with your child, and how have they impacted your relationship?"
    ],
    
    "milestones": [
        "Children grow quickly, and witnessing their milestones is one of the greatest joys of parenting. From their first steps to their first day of school, each milestone marks an exciting chapter in their lives and yours.",
        "Celebrating milestones isn’t just about the big events but also the small, everyday achievements. These moments reflect your child's growth and individuality, helping you appreciate their unique journey.",
        "Which milestones have been the most meaningful to you as a father, and how have they shaped your experience?"
    ],
    
    "support": [
        "Having a strong support network can make a world of difference in fatherhood. Whether it’s family, friends, or parenting groups, finding people who understand and can share insights is invaluable.",
        "Sharing parenting duties with a partner or loved ones not only creates balance but also builds a more cohesive support system. Remember, you don’t have to navigate fatherhood alone.",
        "In what ways has your support system helped you navigate the ups and downs of fatherhood?"
    ],
    
    "patience": [
        "Patience is a cornerstone of parenting, helping children feel secure as they learn and grow. It's okay to have challenging days, but practicing patience can create a nurturing environment where children feel supported.",
        "The journey to becoming a patient father often involves letting go of the need for perfection and embracing the learning process. Patience allows you to fully engage with your children, meeting them where they are.",
        "What strategies have helped you cultivate patience in your parenting approach?"
    ],
    
    "education": [
        "Encouraging curiosity in children helps them enjoy learning and builds a foundation for lifelong growth. Beyond academics, teaching life skills and values is equally important for a well-rounded education.",
        "Parenting provides an opportunity to be a child’s first teacher, guiding them through both practical skills and character-building lessons. Education extends beyond the classroom and can be nurtured through everyday experiences.",
        "How do you integrate educational opportunities into your daily interactions with your child?"
    ],
    
    "parenting styles": [
        "Each child is unique, and adapting your parenting style to their personality can be immensely rewarding. Flexibility and understanding allow you to meet each child’s needs effectively.",
        "Balancing structure and freedom helps create a secure environment while fostering independence. Exploring different approaches can help you find what resonates best for both you and your children.",
        "How would you describe your parenting style, and how has it evolved over time?"
    ],
    
    "emotions": [
        "Modeling healthy emotional expression teaches children how to handle their own feelings. Being open about emotions helps normalize them and strengthens the bond with your child.",
        "Emotional intelligence is crucial in parenting. By showing vulnerability, you help children understand that it’s okay to experience a range of emotions.",
        "How do you approach emotional expression with your children, and what impact have you seen?"
    ],
    
    "time management": [
        "Balancing the demands of work, family, and personal life requires effective time management. Prioritizing time for family can enrich your relationships and bring stability to your routine.",
        "Setting clear boundaries and planning family activities helps ensure quality time, even with a busy schedule. It’s a way to demonstrate commitment to family while managing other responsibilities.",
        "What time management techniques have you found most effective in balancing fatherhood and other areas of life?"
    ],
    
    "discipline": [
        "Discipline is an opportunity to teach children about responsibility, choices, and consequences. It helps create a respectful environment where children feel secure and understand boundaries.",
        "Approaching discipline with consistency and compassion reinforces values and encourages positive behavior. It’s a key element in fostering self-discipline in children.",
        "How do you approach setting boundaries, and what methods work best for discipline in your home?"
    ],
    
    "communication": [
        "Effective communication fosters trust and encourages children to share openly. Approaching conversations with empathy helps children feel valued and understood.",
        "Open communication is about listening as much as speaking. By creating a space for honest dialogue, you can build a relationship where children feel safe to express themselves.",
        "What communication techniques have you found most effective with your children?"
    ],
    
    "self care": [
        "Self-care is essential in parenting, helping you stay balanced and energized. Taking time for yourself ultimately benefits your family by allowing you to be more present.",
        "Prioritizing self-care demonstrates the importance of well-being to your children. It’s a way to model healthy habits and remind yourself that your needs matter too.",
        "What self-care routines help you recharge, and how do they impact your role as a father?"
    ],
    
    "family time": [
        "Spending quality family time creates cherished memories and strengthens bonds. It doesn’t always have to be elaborate; even small activities can nurture family connections.",
        "Creating family traditions builds a sense of unity and provides children with a sense of belonging and identity. Regular family time fosters a supportive and loving environment.",
        "What family traditions or activities do you find most meaningful?"
    ],
    
    "role model": [
        "As a father, being a role model is about embodying the values you hope to pass on. Kindness, integrity, and resilience are traits that leave a lasting impact on children.",
        "Being a positive role model includes acknowledging your own strengths and challenges. This openness helps children learn that growth is a lifelong journey.",
        "What qualities do you hope your children will admire and emulate as they grow?"
    ],
    
    "growth": [
        "Fatherhood offers countless opportunities for self-discovery and growth. Each day brings new lessons and moments of reflection, shaping you as much as you shape your child.",
        "Being a father often inspires personal growth, encouraging you to be more patient, resilient, and understanding. This journey is as much about your development as it is about theirs.",
        "How has fatherhood influenced your personal growth, and what lessons have you learned along the way?"
    ]
    
}

conversation = {
    "I'm really worried I'm not spending enough time with my kids. It's affecting my mental health.": 
        "Alex, it's completely understandable to feel overwhelmed. Juggling the responsibilities of fatherhood with work and studies can be quite challenging. You love your kids, and that’s what truly matters. Let's explore how you can create those special moments with them.",
    
    "I don't have much time between driving for Uber and studying. I feel guilty about not being present.": 
        "Guilt is something many fathers experience, and it shows how much you care. Remember, quality often trumps quantity. Have you considered incorporating your kids into some of your daily activities? Maybe they could help you with meal prep, turning it into a fun cooking session.",
    
    "That's a great idea! But I'm also struggling with sleep. I find myself awake thinking about everything I have to do.": 
        "Sleep is crucial, especially for a father like you. Establishing a calming bedtime routine can help. Perhaps you could try some gentle stretches or deep-breathing exercises to ease your mind before bed. Remember, taking care of yourself enables you to be more present for your kids.",
    
    "I also need to work less and budget better. I want to be more present for them.": 
        "Absolutely, creating a budget can alleviate some of that pressure. Consider setting aside specific funds for family activities each month. It could be a fun outing to the park or a picnic. Involving your kids in planning these activities can also be a bonding experience.",
    
    "That makes sense. I want to be the best father I can be, but it feels overwhelming sometimes.": 
        "You're doing an incredible job just by being aware of these feelings. It's important to remember that no father is perfect. Sharing your struggles with your kids can teach them valuable lessons about honesty and vulnerability. You’re their role model, and they’ll learn resilience from watching you navigate these challenges.",
    
    "I guess I never thought about it that way. It's just hard sometimes.": 
        "It is hard, Alex, and it’s okay to acknowledge that. You're not alone in this journey. Seeking support from other fathers can be incredibly beneficial. Maybe joining a local or online parenting group could help you connect with others who understand what you’re going through.",
    
    "That sounds helpful. I'll look into it. Thanks for listening and offering advice.": 
        "Always here for you, Alex! Remember, being an engaged father is a journey, not a destination. Celebrate the small victories, and don’t hesitate to reach out when you need support. You’re doing a fantastic job navigating this path.",
    "I had an experience with my two boys. The older one hit the other one for snatching one of his toys and proceeded to scream at him  When I intervened and tried to discipline him he mentioned that he reacted this way because this is what he sees from me. (That I yell and I throw things ) I have not hit them but this is quite alarming to me. It made me feel terrible because I not around enough to correctly model better behavior, so when I am around how do I process my feelings of frustration so that I dont ever react in a toxic way again. Im really embarrassed by this and feel awful.":
        "Seeing your son mirror your reactions with throwing and yelling is tough, but your awareness is the first step to change. When frustration builds, notice your body's signals (tense shoulders, quick breathing). Take a moment in another room, telling your kids 'I need a quick breather.' Take Three deep breaths, then return. When you slip up, model honest repair: 'I'm sorry I yelled. I'm learning better ways to handle big feelings, just like you are.' Remember - kids learn more from how we repair than from our perfect moments."

}


@app.route("/")
def index():
    return jsonify({"message": "Welcome to the API!"}), 200

@app.route("/get", methods=["POST"])
def chat():
    data = request.get_json()  
    msg = data.get("msg")  

    
    if not msg:
        return jsonify({"error": "No 'msg' field provided in the request."}), 400

    # Print the incoming message for debugging
    print(f"Received message: {msg}")
    
    token_count = len(tokenizer.encode(msg))

    # Get the appropriate response based on the input message
    response = get_chat_response(msg)
    return jsonify({"response": response, "token_count": token_count}), 200

def get_chat_response(text):
    # Check if the input matches a predefined conversation entry
    if text in conversation:
        return conversation[text]

    # Check if the input matches any fatherhood-related keywords
    matched_keywords = [
        keyword for keyword in fatherhood_responses.keys() if keyword in text.lower()
    ]

    # If there are matched keywords, randomly select one
    if matched_keywords:
        selected_keyword = random.choice(matched_keywords)
        selected_response = random.choice(fatherhood_responses[selected_keyword])
        return selected_response
    
    # If no keyword matches, use the AI model to generate a response
    new_user_input_ids = tokenizer.encode(str(text) + tokenizer.eos_token, return_tensors='pt')
    attention_mask = torch.ones(new_user_input_ids.shape, dtype=torch.long).to(device)

    new_user_input_ids = new_user_input_ids.to(device)
    
    try:
        chat_history_ids = model.generate(new_user_input_ids, attention_mask=attention_mask, max_length=150, pad_token_id=tokenizer.eos_token_id)
    except Exception as e:
        print(f"Error during model generation: {e}")
        return "Sorry, something went wrong."

    return tokenizer.decode(chat_history_ids[:, new_user_input_ids.shape[-1]:][0], skip_special_tokens=True)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
