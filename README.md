# Overview
This application provides a user-friendly interface designed to implementation core functionalities, including user logon, a home page, a search page and a profile page. Special attention is given to compatibility to ensure smooth operation on major iOS devices.

# Features
- **Login Page**: Users can login using their username and password.
- **Biometric Login**: Supports quick login via fingerprint or facial recognition.
- **Home Page**: Unauthenticated user can view the home page includes a widget for displaying images, enhancing the visual interface, while authenticated users can acess personalized content.
- **Search Page**: Offers a search feature to help users quickly find the information they need.
- **Profile Page**: Users can view and edit their personal information here.
- **User Logoff**: Users can logoff any time.
- **Error Page**: Provides a unified error page to inform users about any issues.

# Dependences
| 3rd Party Library  | Version  |
| ------------ | ------------ |
|  testA |  v1.0.0 |
|  testB | v1.0.0  |

# Architecture
### Assumption
**Server Support**: Because there's no backend server support, but to facilitate future compatibility with API service, this app will provide a mock server module to support API request and return mock responses.

### Design Pattern
Due to the need for rapid implmentation in this project, the **MVC** pattern was used.

### Solution Design
![](https://github.com/Cassie1319/InterviewHomeWork/blob/master/readme/solution.png)

### App FlowChart
![](https://github.com/Cassie1319/InterviewHomeWork/blob/master/readme/flowchart.png)

# Installation and Running
1. Clone the repository:
```groovy
git clone https://github.com/Cassie1319/InterviewHomeWork.git
```
2. Open the project in Xcode and run it.

# FAQs
**Q: How can users login?**
A: Users can login using their username and password or quickly via biometric authentication.

**Q: What if an error occurs?**
A: The application will display a unified error page to help user understand what went wrong.

**Q: Can users use the app without logging in?**
A: Yes, users can access the home page even when they are not logged in.
