🏥 **Smart Clinic Management System**

Welcome to Smart Clinic Management System! This is a full-stack medical appointment management system built with Spring Boot, MySQL, and MongoDB. It supports patient, doctor, and admin workflows, JWT authentication, and RESTful APIs.

---

## 🚀 Features
- Patient, Doctor, and Admin dashboards
- Book, update, and cancel appointments
- Doctor availability and filtering
- Prescription management (MongoDB)
- JWT-based authentication
- RESTful API endpoints
- Docker support
- CI/CD with GitHub Actions

---

## 🧰 Tech Stack
- **Backend:** Spring Boot, Java 17
- **Frontend:** HTML, CSS, JavaScript (served from Spring static resources)
- **Database:** MySQL (relational), MongoDB (NoSQL for prescriptions)
- **Authentication:** JWT (JSON Web Token)
- **Build Tool:** Maven
- **Containerization:** Docker
- **CI/CD:** GitHub Actions


## 🛠️ Prerequisites
- Java 17 or later ☕
- Maven 3.8+ 🛠️
- MySQL 8+ 🐬 (running on port 3307)
- MongoDB 4+ 🍃 (running on port 27017)
- Git (for cloning)
- Docker (optional, for containerization)

---

## 📦 Project Structure
```
app/
	src/main/java/com/project/back_end/    # Java source code
	src/main/resources/                    # Application configs & static assets
	Dockerfile                             # Docker build file
	pom.xml                                # Maven dependencies
mongodb/
	sample_prescriptions.js                # Sample MongoDB data
sql/
	sample_data.sql                        # Sample MySQL data
	stored_procedures.sql                  # MySQL stored procedures
```

---

## 📝 Setup Instructions

### 1. Clone the Repository
```bash
git clone <repo-url>
cd java-database-capstone/app
```

### 2. Configure Databases
- **MySQL:**
	- Create a database named `cms` on port 3307.
	- Import `sql/sample_data.sql` and `sql/stored_procedures.sql`.
- **MongoDB:**
	- Import `mongodb/sample_prescriptions.js` into a database named `prescriptions`.

### 3. Configure Application Properties
- Copy `src/main/resources/application.properties.example` to `application.properties`.
- Update DB credentials, JWT secret, and other values as needed.

### 4. Build the Project
```bash
mvn clean install
```

### 5. Run the Application
```bash
mvn spring-boot:run
```
- The backend will start at: `http://localhost:8080/`

### 6. Access the Frontend
- Open `src/main/resources/static/index.html` in your browser.

### 7. API Testing (Examples)
- **Login (Patient):**
	```bash
	curl -X POST http://localhost:8080/patient/login \
		-H "Content-Type: application/json" \
		-d '{"email":"kamble.aniket.ak47@gmail.com","password":"pass@123"}'
	```
- **Get All Doctors:**
	```bash
	curl -X GET http://localhost:8080/doctor
	```
- **Get Appointments (Patient):**
	```bash
	curl -X GET http://localhost:8080/patient/{id}/patient/{token}
	```

---

## 🐳 Docker (Optional)
1. Build Docker image:
	 ```bash
	 docker build -t java-db-capstone .
	 ```
2. Run container:
	 ```bash
	 docker run -p 8080:8080 java-db-capstone
	 ```

---

## 🤖 CI/CD
- GitHub Actions workflow runs tests and builds on every push.

---

## 🙋‍♂️ Support
- For issues, open a GitHub issue or contact the maintainer.

---

## 📚 License
This project is licensed under the MIT License.