
# Patternal - Back End
## Description 🪧

TBD

## Authors 🧑‍💻

<b>(MVP) Moinul Khan 💻</b><br>
<br>
Brendan O'Brien<br>
Camilo Paez<br>
Vianel De La Cruz

## Technologies Used 🛠️

- Node.js
- Express.js
- PostgreSQL
- Flask
- Python3

---
## How It Works 📦

### Setup Instructions

#### Step 1: Clone the Repository

  ```bash
    git clone <repository-url>
    cd Patternal-Back-End
  ```

---

### For the Express App

#### Step 2: Install Dependencies

```bash
npm install
```

#### Step 3: Set Up PostgreSQL Database

- Ensure PostgreSQL is installed and running.
- Configure your database connection settings.

#### Step 4: Initialize and Seed the Database

```bash
npm run db:init       # Initializes the database
npm run db:trig       # Sets up any necessary database triggers
npm run db:seed       # Adds initial values for testing
```

#### Step 5: Start the Server

```bash
npm start
```

---

### For the Flask App

#### Step 1: Set Up a Virtual Environment

```bash
python3 -m venv venv
```

#### Step 2: Activate the Virtual Environment

- For macOS/Linux:

  ```bash
  source venv/bin/activate
  ```

- For Windows:

  ```bash
  venv\Scripts\activate
  ```

#### Step 3: Install Dependencies

```bash
pip3 install -r requirements.txt
pip3 install --upgrade pip
```

#### Step 4: Start the Flask App

```bash
python3 app.py
```

Access the API at `http://127.0.0.1:5001/`.

---

## Docker Setup 🐳

#### Build the Docker Image

```bash
docker build -t flask-app .
```

#### Run the Docker Container

```bash
docker run -p 4000:80 flask-app
```

---

## Scripts ⌨️

| Script           | Description                                      |
|------------------|--------------------------------------------------|
| `npm start`      | Starts the Express server                        |
| `db:init`        | Initializes the PostgreSQL database              |
| `db:seed`        | Seeds the database with initial values           |
| `db:trig`        | Sets up database triggers                        |
