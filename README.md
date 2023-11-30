Project Name: Santa Test  App

Usage Guide:

1. Open Project in Editor:
   Open the project in your preferred Flutter editor (e.g., Android Studio, VSCode).

2. Run the App:
   Execute the following command in the terminal:
   flutter run

3. Interacting with the App:
    - Home Screen: View the list of children and their details.
    - Add Child Screen: Add a new child to the Christmas list.

Functionality Overview:

1. Home Screen:
    - Displays a list of children with their details.
    - Children's details include name, country, and naughty/nice status.
    - Tapping on a child's status toggles between Naughty and Nice.

2. Add Child Screen:
    - Provides a form to add a new child to the list.
    - Fields include Name, Country, and a selection for Naughty/Nice status.

Key Features:

- State Management: Utilizes Riverpod for state management across screens.
- Add Child: Allows users to add new children to the Christmas list.
- Naughty/Nice Toggle: Enables changing the status of a child from Naughty to Nice or vice versa.
- Displays Details: Lists children's details (name, country, status) on the Home Screen.



Riverpod Usage:

- `naughtyNiceProvider`: Manages the Naughty/Nice status of children.
- `selectedCountryProvider`: Tracks the selected country when adding a new child.
- `childrenProvider`: Manages the list of children and their details.

Dependencies:
- Riverpod


