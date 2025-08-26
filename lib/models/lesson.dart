class Lesson {
  final String title;
  final String description;
  final String codeExample;
  final String previewHtml;
  final String? exercise; // Optional exercise for the lesson
  final String? hints; // Optional hints for exercises
  final String
  difficulty; // Level of difficulty: 'Beginner', 'Intermediate', 'Advanced'
  final String
  completionTime; // Estimated time to complete the lesson (e.g., '30 minutes', '1 hour')

  // Constructor
  Lesson({
    required this.title,
    required this.description,
    required this.codeExample,
    required this.previewHtml,
    this.exercise,
    this.hints,
    required this.difficulty,
    required this.completionTime,
  });

  // List of all HTML lessons
  static List<Lesson> getAllLessons() {
    return [
      // Lesson 1: Introduction to HTML
      Lesson(
        title: 'Introduction to HTML',
        description:
            'In this lesson, you will learn the structure of an HTML document. HTML is the standard markup language for creating web pages.',
        codeExample: '''<!DOCTYPE html>
<html>
  <head>
    <title>My First HTML</title>
  </head>
  <body>
    <h1>Welcome to HTML</h1>
    <p>This is my first HTML page!</p>
  </body>
</html>''',
        previewHtml:
            '''<h1>Welcome to HTML</h1><p>This is my first HTML page!</p>''',
        exercise: 'Try modifying the <h1> text to something else.',
        hints: 'Use the <h1> tag to modify the header text.',
        difficulty: 'Beginner',
        completionTime: '15 minutes',
      ),

      // Lesson 2: Text Formatting Tags
      Lesson(
        title: 'Text Formatting Tags',
        description:
            'Learn how to format text with tags like <b>, <i>, <u>, <p>, <h1> to <h6>, etc.',
        codeExample: '''<h1>This is a Heading</h1>
<p>This is a <b>bold</b> paragraph and this is an <i>italic</i> text.</p>
<p>Use the <u>underline</u> tag for underlined text.</p>''',
        previewHtml: '''<h1>This is a Heading</h1>
<p>This is a <b>bold</b> paragraph and this is an <i>italic</i> text.</p>
<p>Use the <u>underline</u> tag for underlined text.</p>''',
        exercise:
            'Try changing the <b>bold</b> tag to <i>italic</i> in the example.',
        hints: 'Remember, the <i> tag is used for italicized text.',
        difficulty: 'Beginner',
        completionTime: '20 minutes',
      ),

      // Lesson 3: HTML Lists
      Lesson(
        title: 'HTML Lists',
        description:
            'Learn how to create ordered and unordered lists with <ul>, <ol>, and <li> tags.',
        codeExample: '''<h2>Unordered List:</h2>
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>

<h2>Ordered List:</h2>
<ol>
  <li>First item</li>
  <li>Second item</li>
  <li>Third item</li>
</ol>''',
        previewHtml: '''<h2>Unordered List:</h2>
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>

<h2>Ordered List:</h2>
<ol>
  <li>First item</li>
  <li>Second item</li>
  <li>Third item</li>
</ol>''',
        exercise:
            'Try adding a new item to both the ordered and unordered list.',
        hints:
            'Use the <ul> tag for unordered lists and <ol> for ordered lists.',
        difficulty: 'Beginner',
        completionTime: '25 minutes',
      ),

      // Lesson 4: HTML Links
      Lesson(
        title: 'HTML Links',
        description: 'Learn how to create hyperlinks using the <a> tag.',
        codeExample: '''<a href="https://www.example.com">Visit Example</a>
<a href="mailto:test@example.com">Send an Email</a>''',
        previewHtml: '''<a href="https://www.example.com">Visit Example</a>
<a href="mailto:test@example.com">Send an Email</a>''',
        exercise: 'Try creating a link to your favorite website.',
        difficulty: 'Beginner',
        completionTime: '15 minutes',
      ),

      // Lesson 5: HTML Forms
      Lesson(
        title: 'HTML Forms',
        description:
            'Understand how forms work in HTML with <form>, <input>, <textarea>, and <button> elements.',
        codeExample: '''<form action="/submit" method="post">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" placeholder="Enter your name">
  <input type="submit" value="Submit">
</form>''',
        previewHtml: '''<form action="/submit" method="post">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" placeholder="Enter your name">
  <input type="submit" value="Submit">
</form>''',
        exercise: 'Try adding a new input field for email in the form.',
        hints: 'The <input> tag can be used for various types of input fields.',
        difficulty: 'Intermediate',
        completionTime: '30 minutes',
      ),

      // Lesson 6: HTML Images and Multimedia
      Lesson(
        title: 'HTML Images and Multimedia',
        description:
            'Learn how to embed images and videos using the <img> and <video> tags.',
        codeExample: '''<img src="image.jpg" alt="Image Example">
<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>''',
        previewHtml: '''<img src="image.jpg" alt="Image Example">
<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>''',
        exercise: 'Try changing the image source to an image of your choice.',
        difficulty: 'Intermediate',
        completionTime: '25 minutes',
      ),

      // Lesson 7: HTML Tables
      Lesson(
        title: 'HTML Tables',
        description:
            'Learn how to create tables using the <table>, <tr>, <th>, and <td> tags.',
        codeExample: '''<table border="1">
  <tr>
    <th>Name</th>
    <th>Age</th>
  </tr>
  <tr>
    <td>John</td>
    <td>30</td>
  </tr>
  <tr>
    <td>Jane</td>
    <td>25</td>
  </tr>
</table>''',
        previewHtml: '''<table border="1">
  <tr>
    <th>Name</th>
    <th>Age</th>
  </tr>
  <tr>
    <td>John</td>
    <td>30</td>
  </tr>
  <tr>
    <td>Jane</td>
    <td>25</td>
  </tr>
</table>''',
        exercise: 'Add a new row to the table with your own name and age.',
        difficulty: 'Intermediate',
        completionTime: '30 minutes',
      ),

      // Lesson 8: HTML Audio and Video
      Lesson(
        title: 'HTML Audio and Video',
        description:
            'Learn how to add audio and video files to a webpage using <audio> and <video> tags.',
        codeExample: '''<audio controls>
  <source src="audio.mp3" type="audio/mp3">
  Your browser does not support the audio element.
</audio>

<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>''',
        previewHtml: '''<audio controls>
  <source src="audio.mp3" type="audio/mp3">
  Your browser does not support the audio element.
</audio>

<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>''',
        exercise: 'Try changing the audio and video sources to files you have.',
        difficulty: 'Intermediate',
        completionTime: '30 minutes',
      ),

      // Lesson 9: HTML5 New Features
      Lesson(
        title: 'HTML5 New Features',
        description:
            'Explore the new features introduced with HTML5, like <section>, <article>, and <footer>.',
        codeExample: '''<section>
  <h2>About Me</h2>
  <p>Welcome to my personal website.</p>
</section>

<article>
  <h3>My Blog Post</h3>
  <p>This is a blog post content.</p>
</article>

<footer>
  <p>Contact Information: info@example.com</p>
</footer>''',
        previewHtml: '''<section>
  <h2>About Me</h2>
  <p>Welcome to my personal website.</p>
</section>

<article>
  <h3>My Blog Post</h3>
  <p>This is a blog post content.</p>
</article>

<footer>
  <p>Contact Information: info@example.com</p>
</footer>''',
        exercise: 'Try adding a new section for your own personal information.',
        difficulty: 'Intermediate',
        completionTime: '30 minutes',
      ),
      // Lesson 10: HTML Input Types
      Lesson(
        title: 'HTML Input Types',
        description:
            'Explore different HTML input types, including `text`, `email`, `password`, `checkbox`, `radio`, `file`, `number`, `range`, `date`, `time`, `color`, `tel`, and more.',
        codeExample: '''<form>
  <!-- Text Input for Name -->
  <div>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">
  </div>

  <!-- Email Input -->
  <div>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email">
  </div>

  <!-- Password Input -->
  <div>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password">
  </div>

  <!-- Checkbox for Terms -->
  <div>
    <label for="terms">Accept Terms:</label>
    <input type="checkbox" id="terms" name="terms">
  </div>

  <!-- Radio Buttons for Gender -->
  <div>
    <label for="gender">Gender:</label>
    <input type="radio" id="male" name="gender" value="male"> Male
    <input type="radio" id="female" name="gender" value="female"> Female
  </div>

  <!-- File Input for Profile Picture -->
  <div>
    <label for="profile-picture">Profile Picture:</label>
    <input type="file" id="profile-picture" name="profile-picture">
  </div>

  <!-- Number Input for Age -->
  <div>
    <label for="age">Age:</label>
    <input type="number" id="age" name="age" min="18" max="100">
  </div>

  <!-- Range Input for Rating -->
  <div>
    <label for="rating">Rating:</label>
    <input type="range" id="rating" name="rating" min="0" max="10" step="1">
  </div>

  <!-- Date Input -->
  <div>
    <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="birthday">
  </div>

  <!-- Time Input -->
  <div>
    <label for="meeting-time">Meeting Time:</label>
    <input type="time" id="meeting-time" name="meeting-time">
  </div>

  <!-- Color Input -->
  <div>
    <label for="favorite-color">Favorite Color:</label>
    <input type="color" id="favorite-color" name="favorite-color">
  </div>

  <!-- Tel Input for Phone Number -->
  <div>
    <label for="phone">Phone Number:</label>
    <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
  </div>

  <!-- URL Input -->
  <div>
    <label for="website">Website:</label>
    <input type="url" id="website" name="website" placeholder="https://www.example.com">
  </div>

  <!-- Submit Button -->
  <div>
    <input type="submit" value="Submit">
  </div>
</form>''',
        previewHtml: '''<form>
  <!-- Text Input for Name -->
  <div>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">
  </div>

  <!-- Email Input -->
  <div>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email">
  </div>

  <!-- Password Input -->
  <div>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password">
  </div>

  <!-- Checkbox for Terms -->
  <div>
    <label for="terms">Accept Terms:</label>
    <input type="checkbox" id="terms" name="terms">
  </div>

  <!-- Radio Buttons for Gender -->
  <div>
    <label for="gender">Gender:</label>
    <input type="radio" id="male" name="gender" value="male"> Male
    <input type="radio" id="female" name="gender" value="female"> Female
  </div>

  <!-- File Input for Profile Picture -->
  <div>
    <label for="profile-picture">Profile Picture:</label>
    <input type="file" id="profile-picture" name="profile-picture">
  </div>

  <!-- Number Input for Age -->
  <div>
    <label for="age">Age:</label>
    <input type="number" id="age" name="age" min="18" max="100">
  </div>

  <!-- Range Input for Rating -->
  <div>
    <label for="rating">Rating:</label>
    <input type="range" id="rating" name="rating" min="0" max="10" step="1">
  </div>

  <!-- Date Input -->
  <div>
    <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="birthday">
  </div>

  <!-- Time Input -->
  <div>
    <label for="meeting-time">Meeting Time:</label>
    <input type="time" id="meeting-time" name="meeting-time">
  </div>

  <!-- Color Input -->
  <div>
    <label for="favorite-color">Favorite Color:</label>
    <input type="color" id="favorite-color" name="favorite-color">
  </div>

  <!-- Tel Input for Phone Number -->
  <div>
    <label for="phone">Phone Number:</label>
    <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
  </div>

  <!-- URL Input -->
  <div>
    <label for="website">Website:</label>
    <input type="url" id="website" name="website" placeholder="https://www.example.com">
  </div>

  <!-- Submit Button -->
  <div>
    <input type="submit" value="Submit">
  </div>
</form>''',
        exercise: 'Add a `date` input field to the form.',
        difficulty: 'Intermediate',
        completionTime: '30 minutes',
      ),

      // Lesson 11: HTML Meta Tags
      Lesson(
        title: 'HTML Meta Tags',
        description:
            'Learn the importance of meta tags for SEO and accessibility, and how to use them for better search engine optimization.',
        codeExample: '''<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Learn HTML with interactive lessons">
  <meta name="author" content="Your Name">
  <title>HTML Meta Tags</title>
</head>''',
        previewHtml: '''<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Learn HTML with interactive lessons">
  <meta name="author" content="Your Name">
  <title>HTML Meta Tags</title>
</head>''',
        exercise:
            'Add a `robots` meta tag to prevent search engines from indexing the page.',
        difficulty: 'Intermediate',
        completionTime: '20 minutes',
      ),

      // Lesson 12: CSS Basics
      Lesson(
        title: 'CSS Basics',
        description:
            'Introduce the basics of CSS, including how to style HTML elements using classes, IDs, and inline styles.',
        codeExample: '''<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
  }
  .header {
    color: blue;
    text-align: center;
  }
</style>
<h1 class="header">Welcome to CSS</h1>
<p>This is an example of styling with CSS.</p>''',
        previewHtml: '''<h1 class="header">Welcome to CSS</h1>
<p>This is an example of styling with CSS.</p>''',
        exercise:
            'Create a class that changes the color of the text to red and applies a bold font style.',
        difficulty: 'Beginner',
        completionTime: '30 minutes',
      ),

      // Lesson 13: HTML5 Forms Validation
      Lesson(
        title: 'HTML5 Forms Validation',
        description:
            'Understand how HTML5 form validation works with required fields, pattern matching, and custom error messages.',
        codeExample: '''<form>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <input type="submit" value="Submit">
</form>''',
        previewHtml: '''<form>
  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <input type="submit" value="Submit">
</form>''',
        exercise:
            'Add a custom error message for the email field if it is left empty.',
        difficulty: 'Intermediate',
        completionTime: '30 minutes',
      ),

      // Lesson 14: HTML5 Canvas
      Lesson(
        title: 'HTML5 Canvas',
        description:
            'Learn how to create and draw graphics with the `<canvas>` element in HTML5.',
        codeExample:
            '''<canvas id="myCanvas" width="500" height="500" style="border:1px solid #000000;"></canvas>
<script>
  var canvas = document.getElementById('myCanvas');
  var ctx = canvas.getContext('2d');
  ctx.fillStyle = '#FF0000';
  ctx.fillRect(20, 20, 150, 100);
</script>''',
        previewHtml:
            '''<canvas id="myCanvas" width="500" height="500" style="border:1px solid #000000;"></canvas>''',
        exercise: 'Draw a circle with a different color on the canvas.',
        difficulty: 'Advanced',
        completionTime: '40 minutes',
      ),

      // Lesson 15: HTML and CSS Responsive Design
      Lesson(
        title: 'HTML and CSS Responsive Design',
        description:
            'Understand how to create responsive designs using CSS media queries to adjust layouts for different screen sizes.',
        codeExample: '''<style>
  body {
    font-family: Arial, sans-serif;
  }
  .container {
    width: 100%;
    padding: 20px;
  }
  @media (max-width: 600px) {
    .container {
      background-color: lightblue;
    }
  }
</style>
<div class="container">
  <p>This container changes color on small screens!</p>
</div>''',
        previewHtml: '''<div class="container">
  <p>This container changes color on small screens!</p>
</div>''',
        exercise:
            'Add a media query to change the font size on smaller screens.',
        difficulty: 'Advanced',
        completionTime: '35 minutes',
      ),
    ];
  }
}
