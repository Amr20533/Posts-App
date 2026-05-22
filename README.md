# Project Overview
Posts App is a mobile application built using Flutter framework which enables users to share their feelings in their posts, seamlessly create, share, and view social media posts.

## Key Features
- Users can login to the home screen.
- Users can Upload Posts.
- Users can view others posts and their posts

## Architectural Design
Maybe it's not the best but it's still well structured, readable, and maintainable.
### Core:
  - constants
  - networks
  - router
  - services
  - themes
  - utils
### Data:
  - auth
  - posts
  - profile
### Features (Logic & Cubits):
  - auth
  - posts
  - profile
### Presentation:
  - auth
  - common widgets
  - posts
  - start

## Packages Used
- bloc --> For Bloc Statemanagement Implementation.
- flutter_bloc --> For Bloc Statemanagement Implementation
- cached_network_image --> For Managing Network Image Cache.
- intl --> For handling date format appearance.
- dio --> For performing CRUD operations and sending requests for the Restapi endpoints.
- shared_preferences --> For Managing Local storage cache operations.
- flutter_secure_storage --> For Securing Local storage cache sensitive data.
- equatable --> To force Dart to compare the data inside the objects rather than the memory address of the objects.
- skeletonizer --> To manage shimmer loadings for data loading status.


## API Documentation

- Postman Documentation Link: 
  https://www.postman.com/lively-desert-95265/workspace/posts-api/collection/22932829-d52219e6-0bc2-4e96-ba4a-4ecddab44a0d?action=share&creator=22932829

- API Documentation Repo:
  https://github.com/Amr20533/Posts-API.git
