# Design Document

By Hazem Helal

[Video URL](https://youtu.be/a_D87yG0vcA)

## Scope
- **Purpose:** Facilitate user reviews for games.
- **Included:** Users, Games, Reviews.
- **Excluded:** Transactions, game development processes.

## Functional Requirements
- **User Capabilities:** Register, log in, manage profiles, browse games, read & submit reviews.
- **Beyond User Scope:** Review moderation, e-commerce.

## Representation

### Entities

- **Users:**
  - user_id (INTEGER, Primary Key)
  - username (TEXT)
  - email (TEXT)
  - password (TEXT, hashed)
  - join_date (TEXT)

- **Games:**
  - game_id (INTEGER, Primary Key)
  - title (TEXT)
  - genre (TEXT)
  - release_date (TEXT)
  - developer (TEXT)
  - platform (TEXT)

- **Reviews:**
  - review_id (INTEGER, Primary Key)
  - user_id (INTEGER, Foreign Key)
  - game_id (INTEGER, Foreign Key)
  - rating (REAL)
  - content (TEXT)
  - publication_date (TEXT)

### Relationships

- ERD: [ERD](https://drive.google.com/file/d/1HlajTG7FRtbP5WXBXvC_WFUh1uT7P2BY/view?usp=drive_link)

## Optimizations

- **Triggers:** Update game ratings automatically.
- **Views:** Access top-rated games and genres easily.
- **Indexes:** Enhance performance for user and game-related queries.

## Limitations

- **Scalability:** May encounter issues with concurrent user interactions.
- **Complex Queries:** Handling intricate user preferences might be challenging.
- **User Interactions:** Detailed interactions or community features may lack support.

In conclusion, ongoing development is needed to address scalability concerns and enhance support for advanced features and user interactions.
