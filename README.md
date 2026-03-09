# 🏥 Orders Service

The **Orders Service** is a **Spring Boot microservice** responsible for managing patient medical orders in the healthcare system.

The service exposes REST APIs to:

* Create medical orders
* Retrieve orders
* Update orders
* Delete orders

The application is containerized using **Docker** and deployed automatically to **AWS EKS using GitHub Actions CI/CD**.

---

# 🚀 Technology Stack

| Technology        | Purpose                         |
| ----------------- | ------------------------------- |
| ☕ Java           | Backend language                |
| 🌱 Spring Boot    | REST API framework              |
| 📦 Maven          | Build and dependency management |
| 🐳 Docker         | Containerization                |
| ☁️ Amazon ECR     | Container registry              |
| ☸️ Amazon EKS     | Kubernetes orchestration        |
| 🔁 GitHub Actions | CI/CD pipeline                  |
| 🔐 AWS OIDC       | Secure authentication           |

---

# 📂 Project Structure

```text
orders/
│
├── .github/workflows/
│   └── orders-ci-cd.yaml
│
├── manifests/
│   └── orders-dev.yaml
│
├── src/
│   └── main/java/com/hcltech/poc/order_service
│
├── Dockerfile
├── pom.xml
└── README.md
```

---

# 🌐 API Endpoints

Base URL

```
/orders
```

---

# 🩺 Health Check

```
GET /actuator/health
```

Response

```json
{
  "status": "UP"
}
```

---

# ➕ Create Order

Creates a new healthcare order.

```
POST /orders
```

Request

```json
{
  "patientId": 1,
  "appointmentId": 101,
  "treatment": "Blood Test",
  "status": "Pending"
}
```

Response

```json
{
  "id": 1,
  "patientId": 1,
  "appointmentId": 101,
  "treatment": "Blood Test",
  "status": "Pending"
}
```

---

# 📋 Get All Orders

```
GET /orders
```

Response

```json
[
  {
    "id": 1,
    "patientId": 1,
    "appointmentId": 101,
    "treatment": "Blood Test",
    "status": "Pending"
  },
  {
    "id": 2,
    "patientId": 2,
    "appointmentId": 102,
    "treatment": "X-Ray",
    "status": "Completed"
  }
]
```

---

# 🔍 Get Order by ID

```
GET /orders/{id}
```

Example

```
GET /orders/1
```

Response

```json
{
  "id": 1,
  "patientId": 1,
  "appointmentId": 101,
  "treatment": "Blood Test",
  "status": "Pending"
}
```

---

# ✏️ Update Order

```
PUT /orders/{id}
```

Request

```json
{
  "patientId": 1,
  "appointmentId": 101,
  "treatment": "Blood Test",
  "status": "Completed"
}
```

Response

```json
{
  "id": 1,
  "patientId": 1,
  "appointmentId": 101,
  "treatment": "Blood Test",
  "status": "Completed"
}
```

---

# ❌ Delete Order

```
DELETE /orders/{id}
```

Example

```
DELETE /orders/1
```

Response

```
204 No Content
```

---

# 🖥 Running Locally

Build the application

```bash
mvn clean package
```

Run the application

```bash
java -jar target/order-service.jar
```

Application runs on

```
http://localhost:8080
```

---

# 🐳 Docker

Build image

```bash
docker build -t orders-service .
```

Run container

```bash
docker run -p 8080:8080 orders-service
```

---

# ☸️ Kubernetes Deployment

Deployment manifest

```
manifests/orders-dev.yaml
```

Deploy

```bash
kubectl apply -f manifests/orders-dev.yaml
```

Check pods

```bash
kubectl get pods
```

Check services

```bash
kubectl get services
```

---

# 🔁 CI/CD Pipeline

This service is deployed automatically using **GitHub Actions**.

Workflow file

```
.github/workflows/orders-ci-cd.yaml
```

Pipeline triggers when:

* Code is pushed to **main branch**
* Workflow is manually triggered

---

# ⚙️ CI/CD Steps

The pipeline performs the following steps:

1️⃣ Checkout source code

2️⃣ Configure AWS credentials using **OIDC**

3️⃣ Login to **Amazon ECR**

4️⃣ Build Docker image

5️⃣ Push image to **ECR**

6️⃣ Connect to **EKS cluster**

7️⃣ Update Kubernetes deployment image

8️⃣ Deploy using **kubectl**

---

# 🔐 Required GitHub Secrets

| Secret           | Description                  |
| ---------------- | ---------------------------- |
| AWS_dev_OIDC_ARN | IAM Role used by GitHub OIDC |
| AWS_dev_REGION   | AWS region                   |
| AWS_ACCOUNT_ID   | AWS account ID               |
| EKS_CLUSTER_NAME | EKS cluster name             |

---

# 🔄 CI/CD Flow

```
Developer Push Code
        │
        ▼
GitHub Actions Trigger
        │
        ▼
Build Docker Image
        │
        ▼
Push Image → Amazon ECR
        │
        ▼
Deploy to AWS EKS
        │
        ▼
Orders Service Running
```
