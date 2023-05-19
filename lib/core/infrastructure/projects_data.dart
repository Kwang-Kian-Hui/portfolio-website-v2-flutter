import 'package:flutter_portfolio_website/core/application/project_class.dart';

List<Project> projectList = [
  Project(
    "Traffic Monitoring System (OpenCV)",
    "Traffic Monitoring",
    ["Python, Others"],
    "\nProject Requirements:"
        "\n\nThe application must run on a Jupyter notebook written in Python and use the OpenCV library. Technically, the algorithm of the "
        "application must be based on the frame differencing and background subtraction techniques."
        "\n\nTasks:"
        "\n\n1) Develop an application for detecting and tracking moving cars from a camera recording. "
        "\n\n2) Count the number of cars to the city center(towards left of the junction based on camera recording).",
    "Features Completed:"
        "\n\n1) Object detection achieved using background subtraction. Differentiating pedestrians, cyclists and vehicles using contour area. "
        "\n\n2) Object tracking achieved using centroid of contour area. Euclidean distance between centroids of current and previous frame "
        "calculated and used to decide if they are the same vehicle."
        "\n\n3) When a vehicle exits the frame, its centroid from previous frame will not be close enough to any of the centroids in current "
        "frame, this is how we decide if a vehicle has exited the screen. If the positional x value of an exiting centroid is below 215 pixels "
        "(about 1/4 of the screen), we will count it as one car going towards the city center."
        "\n\n4) Vertically overlapping vehicles would have their contours combined and detected as one object. Thus, I split any detected object "
        "into 2 separate objects if their height is greater than 130 and area greater than 13500. This allow us to track them as 2 separate vehicles."
        "\n\n5) Stopped vehicles are still detected based on the difference of the background frame and the current frame (excluding the first 2 stopped vehicles).",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Traffic-Monitoring-System--OpenCV-",
    "",
    "",
    "",
    "",
    "",
    "Future Improvements:"
        "\n\n1) Vehicle direction can be determined by calculating previous and current frame's positional x value and subtracting them to "
        "determine the direction. If current frame x - previous frame x is negative, it can be said that the vehicle is going towards the city center."
        "\n\n2) Improve algorithm to detecting separate objects which are too close to each other."
        "\n\n3) Background subtractor fails to detect the first 2 vehicles once they have stopped at the junction due to the learning rate of the "
        "background subtractor. Parameters should be optimised for them to be detected.",
    [
      "assets/images/traffic_monitoring_system_img_1.png",
      "assets/images/traffic_monitoring_system_img_2.png",
    ],
  ),
  Project(
    "Social Networking Web Application",
    "SocialNetApp",
    [
      "Frontend",
      "Backend",
      "Data",
      "Python",
      "HTML/CSS",
      "JavaScript",
      "Web/Mobile"
    ],
    "Frontend: HTML/CSS/JS (Bootstrap)"
        "\nBackend: Python (Django)"
        "\nDatabase: PostgreSQL"
        "\n\nProject Description:"
        "\n\nImplement your own social network web application."
        "\n\nRequirements:"
        "\n\n1) Allow users to create new password secured accounts."
        "\n\n2) Collect and store an appropriate amount of information about each user (e.g. user name, use picture)."
        "\n\n3) Each user should have a home page that shows their user information and any other interesting data such as images, picture galleries or other media files. And displays user status updates. These home pages should be discoverable and visible to other users."
        "\n\n4) Users should be able to post status updates to their home page."
        "\n\n5) Users should be able to search for other users and “add” them to their network of contacts or friends."
        "\n\n6) Users should also be able to view a list of their friends."
        "\n\n7) Additionally users should be able to use a portion of the application that makes use of real time communication by using web sockets. Some examples may be realtime chat between friends, a basic computer game or media/audio streaming. You are free to use web sockets as you wish but you must include 1 web sockets app in your application.",
    "Features Completed:"
        "\n\n1) Users may register and login to their account with an email and password."
        "\n\n2) Email, username, password, profile image, date joined and last login date of user is stored in the database."
        "\n\n3) User may post status on their home page and it can be viewed only by themselves or their friends. Post may or may not include an image but must have captions or texts written."
        "\n\n4) User may search for other users via the search bar."
        "\n\n5) Users may view a list of their friends and chats with them."
        "\n\n6) Users may start a new chat with friends. Past messages will be displayed."
        "\n\n7) User and friend list API written. Nested serializers used to display list of friends of a specific user.",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Advanced-Web-Development-Final-Coursework",
    "",
    "",
    "",
    "",
    "",
    "Future Improvements:"
        "\n\n1) Use of websocket to enable async messages between friends. The current issue faced is that I am unable to display past messages despite the websocket private chat rooms being implemented successfully. How I would usually pass data using Objects.get() method does not work with the HTML codes for websocket private chat."
        "\n\n2) When users update their profile image, it seems that the image does not update itself but when the web browser cache is cleared, the profile image updates to the correct image. Not sure if there is any solution for the cache to be cleared automatically when user updates the profile image."
        "\n\n3) Resizing and recropping of images in application can be implemented to better standardize image size and ratio. Currently, images are forcibly resized to the size defined by the style of the element in HTML file."
        "\n\n4) Infinite scrolling with pagination to improve home page loading performance as the number of data can grow to be very large in an actual social media app.",
    [
      "assets/images/registration-page.png",
      "assets/images/home-page.png",
      "assets/images/home-page-2.png",
      "assets/images/search-user-kwargs-b.png",
      "assets/images/self-profile-page.png",
      "assets/images/friend-list-page.png",
      "assets/images/friend-profile-page.png",
      "assets/images/chat-list-page.png",
      "assets/images/chat-page.png",
      "assets/images/friend-detail-api.png",
    ],
  ),
  Project(
    "Portfolio Website 1 (HTML/CSS/JS)",
    "Portfolio Website 1",
    ["Frontend", "HTML/CSS", "JavaScript", "Web/Mobile"],
    "\nProject Description:"
        "\n\nA personal portfolio website completed with the help of some online tutorial guides. Includes SVG + CSS animation. Javascript for state management and navigation.",
    "",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/portfolio-website",
    "",
    "",
    "",
    "https://kwang-kian-hui.github.io/portfolio-website/",
    "",
    "",
    [
      "assets/images/home-section.png",
    ],
  ),
  Project(
    "Portfolio Website 2 (Flutter)",
    "Portfolio Website 2",
    ["Frontend", "Dart", "Web/Mobile", "CI/CD"],
    "\nProject Description:"
        "\n\nDeveloped using Flutter (Dart)"
        "\n\nImplementing CI/CD pipeline using Github Actions to automate deployment process for Flutter web."
        "\n\nWorkflow is triggered on changes to main branch",
    "As Flutter web becomes more mature and stable over the years, I thought this could be a good opportunity to test it out for myself.",
    DateTime(2022, 10),
    "https://github.com/Kwang-Kian-Hui/portfolio-website-v2-flutter",
    "",
    "",
    "",
    "",
    "",
    "Future Work:"
        "\n\nAdding end-to-end tests and include it into the Github Actions workflow.",
    [
      "assets/images/welcome-page.png",
    ],
  ),
  Project(
    "Speech Recognition System (Mozilla DeepSpeech)",
    "Speech Recognition System",
    ["Others", "Python"],
    "\nProject Description:"
        "\n\nA software development company has contacted you to create a speech recognition system to integrate in a Python project they are developing. In particular, the project consists of an airport virtual assistant."
        "\n\nRequirements:"
        "\n\n1) Base the speech recognition system on the Mozilla DeepSpeech software package."
        "\n\n2) Capable of language-selection, at the very least compatible with the following languages: English, Italian and Spanish."
        "\n\n3) The airport virtual assistant will be installed in an environment that can be extremely noisy. So, the speech recognition system should be configured to be able to handle this situation. Your client gives you freedom for implementing any solution (for example, to configure in python a gain/amplification, low pass filter, or some other audio filter to improve the error rate)."
        "\n\n4) The company has prepared a set of audio files with which you can evaluate the system. For this evaluation, you will test how well it recognises several phrases in each language. You also have to record and evaluate two short sentences (your_sentence1.wav and your_sentence2.wav). Feel free to prepare your own sentences",
    "Features Completed:"
        "\n\n1) Console based application. Allows language selection by entering the language name. e.g. 'English', 'english' or 'en'."
        "\n\n2) Mozilla DeepSpeech model and scorer is loaded in the application based on the language selected by user."
        "\n\n3) Spectral subtraction and low pass filter applied to audio files to attempt to reduce background noise. Crowd noise used for spectral subtraction downloaded from: https://mixkit.co/free-sound-effects/crowd/. \n\nLibrosa library load() and stft() function is used, along with numpy to load and transform the sample values into a subtractable form for spectral subtraction. Scipy library is used to perform low pass filter."
        "\n\n4) Performance is evaluated by processing the predicted texts with the transcript texts. Overall performance result:"
        "\n\nEnglish word error rate(WER) of 18.84%, Spanish WER of 35.71% and Italian WER of 36.67",
    DateTime(2021, 12),
    "https://github.com/Kwang-Kian-Hui/Speech-Recognition-System--Mozilla-DeepSpeech-",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/deepspeech-1.png",
      "assets/images/deepspeech-2.png",
      "assets/images/deepspeech-3.png",
      "assets/images/deepspeech-4.png",
    ],
  ),
  Project(
    "Audio Visualization with MeydaAnalyzer and Speech Recognition (p5.js)",
    "Meyda Speech Command",
    ["Others", "JavaScript"],
    "\nProject Description:"
        "\n\nDevelop an interactive web-based application for audio visualization. The application must be based on p5.js, p5.speech and the JavaScript audio feature extraction library Meyda."
        "\n\nRequirements:"
        "\n\n1) Use audio features and map them to visual variables (shapes, size, etc.)."
        "\n\n2) Voice control system, background color and shape changes.",
    "Features Completed:"
        "\n\n1) Background color can be changed with voice command ('red', 'green', 'blue', 'black', 'white'). Color of shapes changes based on background color."
        "\n\n2) Shape can be changed with voice command ('Square', 'Triangle', 'circle')."
        "\n\n3) Audio features used: zcr, energy, Spectral Centroid, Spectral Flatness, SpectralSpread and Spectral Kurtosis, Spectral Rolloff."
        "They were chosen as the pitch and loudness of the audio file changes drastically throughout the duration of the audio, providing a better visual experience.",
    DateTime(2021, 12),
    "https://github.com/Kwang-Kian-Hui/Audio-Visualization-with-MeydaAnalyzer-and-Speech-Recognition-p5.js-",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/default-square.png",
      "assets/images/red-circle.png",
      "assets/images/white-circle.png",
    ],
  ),
  Project(
    "Video Format Converter with ffmpeg",
    "Video Format Converter",
    ["Others", "Python"],
    "\nProject Description:"
        "\n\nThe Narbonne Online Film Festival receives every year more than one hundred films in digital format. The problem is that some of these films are not submitted in the format specified by the festival organisation, and they must be converted. The organisation wants to automate this process by developing an application (exercise 3) for examining the format of the films and, if necessary, convert them."
        "\n\nRequirements:"
        "\n\n1) The application must run on a Jupyter notebook written in Python, use ffprobe to examine the files, and ffmpeg to convert the films."
        "\n\n2) From a series of video files, the application should generate a brief report in TXT indicating which films do not respect the digital format specified by the festival and what are the 'problematic' fields."
        "\n\n3) The application should automatically convert the submitted films with an incorrect format. The program will create a new copy of the films by adding '_formatOK' at the end of the name. Specified format shown in first screenshot.",
    "Features Completed:"
        "\n\n1) ffprobe used to examine video formats and txt file report generated correctly, indicating all problematic fields for each specific files."
        "\n\nffmpeg used to convert format of file into the specified format.",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/ffprobe--ffmpeg-Video-Format-Converter",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/converter_format.png",
      "assets/images/converter_img_1.png",
      "assets/images/converter_img_2.png",
    ],
  ),
  Project(
    "Location Alarm (Android, Flutter)",
    "Location Alarm",
    ["Frontend", "Data", "Dart", "Web/Mobile"],
    "\nProject Description:"
        "\n\nLocation Alarm is an app that allow users to create an alarm with a set destination and radius, and when their devices are within the radius of their destination, the alarm will ring. This app uses the Map and Places API of Google Cloud Platform for the map features and address suggestions when users are searching for their destination. Some android devices are unable to receive background location updates due to the device's battery saving processes."
        "\n\nKey Takeaways:"
        "\n\n1) Usage of Google Map and Places APIs."
        "\n\n2) Publishing app to Google Play Store for internal testing, and releasing for public use."
        "\nBackground location packages' limitations as the feature only works for certain android devices and a better solution is required.",
    "Features Completed:"
        "\n\n1) Google Maps API (map features, markers, and positional radius)"
        "\n\n2) Google Places API (search bar, address/postal/building name suggestions)"
        "\n\n3) SQLite local device database"
        "\n\n4) Alarm rings when device is within set radius of destination."
        "\n\n5) Ringtone or vibrate",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/location-alarm_v2",
    "",
    "",
    "https://play.google.com/store/apps/details?id=com.location_alarm",
    "",
    "https://www.youtube.com/watch?v=9kuAkN7wnuQ",
    "Future Improvements:"
        "\n\n1) Background location is not yet released. An additional change to the app where a prominent disclosure before the app's runtime is required to adhere to Google permissions policy in order for the update to be released. Without this, the location does not update when the screen is locked.",
    [
      "assets/images/initial-page-permission-request.png",
      "assets/images/add-edit-alarm-page.png",
      "assets/images/home-page-with-alarms.png",
    ],
  ),
  Project(
    "DEALL (Android, Flutter)",
    "DEALL",
    ["Frontend", "Data", "Dart", "Web/Mobile"],
    "\nProject Description:"
        "\n\nDEALL is a mobile platform that allow food retailers to list their surplus food on discount, while consumers can view them, with the goal of reducing food waste in the process."
        "\n\nDatabase: Google Firestore (NoSQL)",
    "Work done by me in this group assignment:"
        "\n\n1) Low fidelity and High fidelity prototyping using Figma"
        "\n\n2) Application logic for consumer's home page which displays the list of retailers available by calling Google Firestore conditional queries."
        "\n\n3) Add product feature for retailers where they will fill up a form with input validations before adding the product data to Google Firestore."
        "\n\n4) Application logic for consumer's retailer product list and detail page which displays the list of products offered by the specific retailer that the user has selected and the retailer's detail when the 'show detail' button is pressed."
        "\n\n5) Other minor changes in the nature of bug fixes and feedback.",
    DateTime(2021, 12),
    "https://github.com/sinhaugoh/DEALL",
    "https://www.figma.com/file/QGGYjGRb81bGE0eCbXgqLo/Lo-fi?node-id=274%3A817",
    "https://www.figma.com/file/ydrr0N3qhP3d9sjWAwJbxU/Hi-fi?node-id=315%3A2",
    "",
    "",
    "",
    "",
    [
      "assets/images/consumer-home-page-retailer-list.png",
      "assets/images/consumer-retailer-product-list-page.png",
      "assets/images/consumer-retailer-details-page.png",
    ],
  ),
  Project(
    "p5.js Projects",
    "p5.js Projects",
    ["Frontend", "JavaScript", "Web/Mobile", "Others"],
    "\nProject Description:"
        "\n\nA series of assignments using p5.js to create games, animations or graphical effects."
        "\n\nProjects:"
        "\n\n1) Solar System - graphical animations simulating a solar system"
        "\n\n2) Asteroid Game Clone - gravity effect when near Earth, and collision for destroying asteroids"
        "\n\n3) Angry Birds Game Clone - p5 physics"
        "\n\n4) Noisy Grid - graphical animations based on mouse position"
        "\n\n5) 3D Sin Animation - graphical animations"
        "\n\n6) Average Face - generate new 'average' face based on multiple faces"
        "\n\n7) Instagram Filters - various filters on image"
        "\n\n8) Webcam Piano - movement detection through webcam and plays piano keynotes based on position of movement",
    "Various p5.js libraries used.",
    DateTime(2021, 12),
    "https://github.com/Kwang-Kian-Hui/graphics-programming",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/solarSystem.png",
      "assets/images/asteroidGameClone.png",
      "assets/images/angryBirdsGameClone.png",
      "assets/images/noisyGrid.png",
      "assets/images/3DSinAnimation.png",
      "assets/images/averageFace1.png",
      "assets/images/averageFace2.png",
      "assets/images/instagramFilter1.png",
      "assets/images/instagramFilter2.png",
    ],
  ),
  Project(
    "MerkelRexBot(C++) - Crypto Trading Bot",
    "C++ Crypto Trading Bot",
    ["Others", "C++", "Predictive Analytics"],
    "\nProject Description:"
        "\n\nMerkelRexBot is a command-line UI exchange simulation which allows a human to carry out market analysis and trading activities "
        "such as bidding for and offering trades. However, it also has the capability to make trades in the place of human users. "
        "Linear regression model is used on a group of sample data to generate the price predictions. Trades will then be made based on the predictions."
        "\n\nCode and csv data is available in Github",
    "Before linear regression model is used to predict future price, we will analyse different digital currencies' exchange rates, ask volume, and bid volume."
        "The ask and bid volume is used to produce an ask/bid volume ratio. When the ask volume is higher than bid volume, the prices of the products are likely to increase"
        "as it indicates strong buying pressure (higher ask/bid ratio). If the ask/bid ratio of an exchange is high, we will check if the spread is low enough."
        " Low spread means that the cost of trading a certain product is lower and it usually indicates a high trading volume. If these conditions are met, "
        "the price prediction is made and if the potential return exceeds the spread, we will make a trade order",
    DateTime(2021, 10),
    "https://github.com/Kwang-Kian-Hui/MerkelRex",
    "",
    "",
    "",
    "",
    "",
    "Future Improvements:"
        "\n\nConditions for making trades can be improved as bot stops making trades after the first time iteration due to the trading conditions not being met.",
    [
      "assets/images/merkelrex-cover.png",
      "assets/images/merkelrex-img-1.png",
      "assets/images/merkelrex-img-2.png",
      "assets/images/merkelrex-img-3.png",
    ],
  ),
  Project(
    "Otodecks(C++) - Music Library Mixer",
    "Music Library Mixer",
    ["Others", "C++"],
    "\nProject Description:"
        "\n\nA Music Library Mixer with custom GUI. Mp3 files may be loaded onto the track and we can search for tracks using the search bar. "
        "Allows 2 audio files to be played at the same time with controls such as play, stop, fast forward, back track, volume, speed, audio position, replay and looping.",
    "",
    DateTime(2021, 10),
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/otodecks-img-1.png",
      "assets/images/otodecks-img-2.png",
    ],
  ),
  Project(
    "Data Programming Research",
    "Data Research",
    ["Data", "Others", "Python", "Data Analytics/Engineering"],
    "\nProject Description:"
        "\n\nThe project's research is on \"Correlation between key variables of the countries' happiness index and COVID-19 vaccinations\".",
    "Steps:"
        "\n\n1) Data Extraction: Two relevant csv data files were downloaded, and web scraping was performed with BeautifulSoup to extract key data. "
        "\n\n2) Data Preparation: The pandas dataframes were merged along with the web scraped data to form a single large dataframe. "
        "Data cleaning and transformation is then performed."
        "\n\n3) Data Analysis: Bar chart, Sunburst chart and Heatmap charts were produced and analysed to construct findings.",
    DateTime(2021, 10),
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/web-scraping.png",
      "assets/images/bar-chart.png",
      "assets/images/sun-burst-chart.png",
      "assets/images/heatmap-chart.png",
    ],
  ),
  Project(
    "Multiclass Classification with KNN Cross Validation",
    "KNN Cross Validation",
    ["Others", "Python", "Predictive Analytics"],
    "\nProject Description:"
        "\n\nIn this coursework, the Wine dataset (178 sample dataset that categorises three different types of Italian wine using 13 different features) is used."
        "We will need to present our own code that performs nested cross-validation and the k-nearest neighbour algorithm, build confusion matrices, and estimate distances between data samples.",
    "Steps:"
        "\n\n1) Exploratory Data Analysis - columns, min/max/mean/sd per column, class distribution"
        "\n\n1.1) Data Visualisation - identify correlations between alcohol level, flavanoids, color_intensity and ash using sns pair grid correlation plot"
        "\n\n1.2) Exploratory Data Analysis under noise - (Gaussian noise)"
        "\n\nTwo classifiers with least overlaps selected to build classifier"
        "\n\n2) Implementing KNN"
        "\n\nEuclidean/manhattan/chebyshev distance are calculated to identify K nearest neighbours using the two classifiers as data points."
        "\n\nDistances are sorted from smallest to largest. Odd number k number of neighbours used to make prediction."
        "\n\n3) Classifier Evaluation:"
        "\n\nAccuracy, precision, recall and f1 score calculated to evaluate classifier"
        "\n\nConfusion matrix built to visualise true/false positives and true/false negatives"
        "\n\n4) Nested Cross-validation using your implementation of KNN"
        "\n\nSplit data into five equal folds and cross validation conducted using different distance metrics.",
    DateTime(2022, 1),
    "https://github.com/Kwang-Kian-Hui/Machine-Learning-and-Neural-Networks",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/correlation_plot.png",
      "assets/images/confusion_matrix.png",
      "assets/images/confusion_matrix_grouping.png",
      "assets/images/classifier_evaluation.png",
      "assets/images/summary_results.png",
    ],
  ),
  Project(
    "Multiclass Classification (Sign Language MNIST)",
    "Classification with ML Models",
    ["Others", "Python", "Predictive Analytics"],
    "\nProject Description:"
        "\n\nIn this coursework, the Sign Language MNIST dataset (27455 training, 7172 testing dataset, 28x28 pixel image, 24 labels representing each alphabet where J and Z is not included as it requires motion (unable to represent in 1 image)) is used.",
    "Steps: "
        "\n\n1) Data Preparation - Converting data into tensors:"
        "\n\nNormalize tensor values"
        "\n\n2) Develop baseline model and another model that performs better"
        "\n\nModels developed using tensorflow keras models"
        "\n\nLoss function of categorical crossentropy used to evaluate multiclass single-label classification."
        "\n\n3) Overfitting model:"
        "\n\nConvolution layers and max pooling used to reduce the spatial dimensions of the inputs (downsample) coming from the convolution layers."
        "\n\nMax pooling 2D is typically used for RGB images while 1D is typically used for audio and 3D for multiple images from video."
        "\n\n4) Finetuning Hyperparameters:"
        "\n\nBatch normalization is added to speed up the learning process. It does so by standardizing the inputs to a layer for each mini-batch and reduces the number of training epochs required to train networks."
        "\n\nDropout is added to prevent overfitting of the model."
        "\n\nRegularizer is added to reduce the error by fitting a function appropriately on the given training set and avoid overfitting."
        "\n\nFinal model achieved accuracy of 96.88%",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Machine-Learning-and-Neural-Network-Final-Coursework",
    "",
    "",
    "",
    "",
    "",
    "",
    [
      "assets/images/dataset.png",
      "assets/images/baseline.png",
      "assets/images/overfit.png",
      "assets/images/best.png",
    ],
  ),
  Project(
    "Automatic Time Scheduler - Mobile App (Flutter)",
    "Automatic Time Scheduler",
    ["Frontend", "Data", "Dart", "Data Analytics/Engineering", "Web/Mobile"],
    "\nProject Description:"
        "\n\nThis app helps to schedule tasks for users based on deadline priorities. Users are able to set several personalization settings such as working hours, break hours, and days that they are working on."
        " Tasks will not be scheduled on non working hours including breaks."
        "\n\nKey Features:"
        "\n\n1) Add/Edit/Delete events or tasks on calendar. Events - events that does not require any action from user. Tasks - events that require a set duration of time from user (must not overlap with other tasks)."
        "\n\n2) For events, user must specify start and end date. For tasks, if no start and end date is specified, a duration must be provided and the app will schedule the task for the user."
        "\n\n3) Users can mark existing tasks as completed or uncompleted."
        "\n\n4) Different calendar views (day/week/month) and filter tasks by completion status."
        "\n\n5) Import events from Google Calendar."
        "\n\n6) Other personalization settings (Event/Task categories, Color Themes)"
        "\n\nGoogle Firestore NoSQL database used. Firebase Authentication, Google Calendar API",
    "Algorithm/Technique used: binary time list"
        "\n\nOne challenge I encountered was determining the available time for scheduling, considering varying break hours and non-working hours for each day. Using conditional statements (if conditions) to handle this "
        "scenario proved highly inefficient and made the feature difficult to debug. To address this, I devised an alternative approach."
        "\n\nI devised a solution by utilizing a list structure to represent time availability. Each element in the list corresponds to a one-minute interval, where '1' represents availability and '0' represents "
        "unavailability. To represent a full day of 24 hours, the initial list length was set to 1440 elements (one for each minute). However, to optimize efficiency, I condensed the list to a length of 288, with each "
        "element representing a five-minute interval."
        "\n\nTo determine the available working hours for a given day, the process followed these steps:"
        "\n1) Initialize the list with 288 elements, all set to '0' to indicate unavailability."
        "\n2)Based on customized working hours, set the corresponding range of indexes to '1' to indicate availability."
        "\n3)Similarly, considering customized break hours, set the corresponding range of indexes to '0' to indicate unavailability."
        "\n\nBy following these steps, the resulting list provides a clear representation of the available working hours for the specific day, incorporating variations in working and break hours."
        "\n\nUnsigned 8 bit integer was used instead of boolean as boolean in Dart language uses 2 bytes while unsigned 8 bit integer uses 1 byte, reducing the memory usage by half.",
    DateTime(2022, 8),
    "",
    "https://www.figma.com/file/mV24w6TCa6yWRehhHPhW2D/Low-Fidelity-Prototype?node-id=0%3A1",
    "https://www.figma.com/file/JSJnW7sG8kSCEoNAxpATCO/High-Fidelity-Prototype?node-id=0%3A1",
    "",
    "",
    "",
    "",
    [
      "assets/images/login-page.png",
      "assets/images/signup-validation.png",
      "assets/images/add-task.png",
      "assets/images/calendar-page.png",
      "assets/images/settings-page.png",
      "assets/images/working-hours.png",
    ],
  ),
  Project(
    "Quantexa Data Engineer Certification Project",
    "Quantexa Project",
    ["Data", "HTML/CSS", "Scala", "Data Analytics/Engineering"],
    "\nProject Description:"
        "\n\nThis project equips us with the following skill sets:"
        "\n\n1) Writing correctly defined Document Models and convert CSV to parquet files."
        "\n\n2) Writing Spark scripts in Scala to join datasets using Spark Dataset API."
        "\n\n3) Compound resolution, compound exclusions, entity network graph and document scoring for Quantexa tool UI."
        "\n\n4) HTML/CSS to customise Quantexa UI",
    "",
    DateTime(2023, 5),
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    [],
  ),
];
