# Lover Technical Challenge

The objective of this challenge is to evaluate your overall knowledge of Flutter with some packages that we use in our main app.
There is no need to finish all the requirements, the evaluation criteria is the solution to the prompt, the organization of the project and
coding good practices.

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/d2c-holdings/lover-challenge.git
```

**Step 2:**

Go to the project root and execute the following command in the console to get the required dependencies:

```
flutter pub get 
```

## What you are going to build:

#### Add a new bottom navigation item for a new tab, with:

- Label: Cats

- Icon: https://svgshare.com/i/jtj.svg

#### This new tab page, should consume the external public Items List API https://docs.thecatapi.com/api-reference using the API key **
“c344c695-60f6-4665-86a9-3d9f88c0445b“**, from which it’s needed to:

- Retrieve all available Cat breeds and their information;

- Implement a blank/loading page when the list is still being retrieved;

- Cache the retrieved list for the session;

- Implement an interactive vertical list for the cat breeds, presenting the breed information, and allowing:

    - Any breed to be removed from the local list, with the icon: https://svgshare.com/i/jsR.svg;

#### Analytics

Implement Mixpanel analytics https://pub.dev/packages/mixpanel_flutter
using the API key **“bebcd1425dd1eb1926b978bc0fd84ce4“**, with user profiles, properties, and events to be set and sent accordingly to:

- User changes tab: Please, send the event “tab_opened” with the property “tab: {$tabName}";

- The list isn’t loaded yet: Please, set the people property “empty_list“ true AND send the event “fetched_breeds” with the property
  “length: 0";

- The list has finished loading: Please, set the people property “empty_list“ false AND send the event “fetched_breeds” with the property
  “length: ${breedsList.length}";

- User deletes a cat breed from the list: Please, send the event “breed_removed” with the property “breed_id: {$breedId}";

## Finishing the challenge:

When the tasks are done, please create a pull request to the development branch.
