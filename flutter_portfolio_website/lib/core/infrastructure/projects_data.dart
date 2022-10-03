import 'package:flutter_portfolio_website/core/application/project_class.dart';

List<Project> projectList = [
  Project(
    "Traffic Monitoring System (OpenCV)",
    "Traffic Monitoring",
    ["Others"],
    ["Python"],
    ["Others"],
    "Project Requirements:"
        "\n\nThe application must run on a Jupyter notebook written in Python and use the OpenCV library. Technically, the algorithm of the "
        "application must be based on the frame differencing and background subtraction techniques."
        "\n\nTasks:"
        "\n(1) develop an application for detecting and tracking moving cars from a camera recording. "
        "\n(2) count the number of cars to the city center(towards left of the junction based on camera recording).",
    "Features Completed:"
        "\n(1) Object detection achieved using background subtraction. Differentiating pedestrians, cyclists and vehicles using contour area. "
        "\n(2) Object tracking achieved using centroid of contour area. Euclidean distance between centroids of current and previous frame "
        "calculated and used to decide if they are the same vehicle."
        "\n(3) When a vehicle exits the frame, its centroid from previous frame will not be close enough to any of the centroids in current "
        "frame, this is how we decide if a vehicle has exited the screen. If the positional x value of an exiting centroid is below 215 pixels "
        "(about 1/4 of the screen), we will count it as one car going towards the city center."
        "\n(4) Vertically overlapping vehicles would have their contours combined and detected as one object. Thus, I split any detected object "
        "into 2 separate objects if their height is greater than 130 and area greater than 13500. This allow us to track them as 2 separate vehicles."
        "\n(5) Stopped vehicles are still detected based on the difference of the background frame and the current frame (excluding the first 2 stopped vehicles).",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Traffic-Monitoring-System--OpenCV-",
    "Future Improvements:"
        "\n(1) Vehicle direction can be determined by calculating previous and current frame's positional x value and subtracting them to "
        "determine the direction. If current frame x - previous frame x is negative, it can be said that the vehicle is going towards the city center."
        "\n(2) Improve algorithm to detecting separate objects which are too close to each other."
        "\n(3) Background subtractor fails to detect the first 2 vehicles once they have stopped at the junction due to the learning rate of the "
        "background subtractor. Parameters should be optimised for them to be detected.",
    [
      "assets/images/projects/traffic-monitoring-system/traffic_monitoring_system_img_1",
      "assets/images/projects/traffic-monitoring-system/traffic_monitoring_system_img_2"
    ],
  ),
  Project(
    "Traffic Monitoring System (OpenCV)",
    "Traffic Monitoring",
    ["Others"],
    ["Python"],
    ["Others"],
    "Project Description:"
        "\n\nThe application must run on a Jupyter notebook written in Python and use the OpenCV library. Technically, the algorithm of the "
        "application must be based on the frame differencing and background subtraction techniques."
        "\n\nRequirements:"
        "\n(1) develop an application for detecting and tracking moving cars from a camera recording. "
        "\n(2) count the number of cars to the city center(towards left of the junction based on camera recording).",
    "Features Completed:"
        "\n(1) Object detection achieved using background subtraction. Differentiating pedestrians, cyclists and vehicles using contour area. "
        "\n(2) Object tracking achieved using centroid of contour area. Euclidean distance between centroids of current and previous frame "
        "calculated and used to decide if they are the same vehicle."
        "\n(3) When a vehicle exits the frame, its centroid from previous frame will not be close enough to any of the centroids in current "
        "frame, this is how we decide if a vehicle has exited the screen. If the positional x value of an exiting centroid is below 215 pixels "
        "(about 1/4 of the screen), we will count it as one car going towards the city center."
        "\n(4) Vertically overlapping vehicles would have their contours combined and detected as one object. Thus, I split any detected object "
        "into 2 separate objects if their height is greater than 130 and area greater than 13500. This allow us to track them as 2 separate vehicles."
        "\n(5) Stopped vehicles are still detected based on the difference of the background frame and the current frame (excluding the first 2 stopped vehicles).",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Traffic-Monitoring-System--OpenCV-",
    "Future Improvements:"
        "\n(1) Vehicle direction can be determined by calculating previous and current frame's positional x value and subtracting them to "
        "determine the direction. If current frame x - previous frame x is negative, it can be said that the vehicle is going towards the city center."
        "\n(2) Improve algorithm to detecting separate objects which are too close to each other."
        "\n(3) Background subtractor fails to detect the first 2 vehicles once they have stopped at the junction due to the learning rate of the "
        "background subtractor. Parameters should be optimised for them to be detected.",
    [
      "assets/images/projects/traffic-monitoring-system/traffic_monitoring_system_img_1",
      "assets/images/projects/traffic-monitoring-system/traffic_monitoring_system_img_2"
    ],
  ),
  Project(
    "Social Networking Web Application (Django)",
    "SocialNetApp",
    ["Frontend", "Backend", "Data"],
    ["Python", "HTML/CSS", "JavaScript"],
    ["Web/Mobile"],
    "Project Description:"
        "\n\nImplement your own social network web application."
        "\n\nRequirements:"
        "\n(1) Allow users to create new password secured accounts."
        "\n(2) Collect and store an appropriate amount of information about each user (e.g. user name, use picture)."
        "\n(3) Each user should have a home page that shows their user information and any other interesting data such as images, picture galleries or other media files. And displays user status updates. These home pages should be discoverable and visible to other users."
        "\n(4) Users should be able to post status updates to their home page."
        "\n(5) Users should be able to search for other users and “add” them to their network of contacts or friends."
        "\n(6) Users should also be able to view a list of their friends."
        "\n(7) Additionally users should be able to use a portion of the application that makes use of real time communication by using web sockets. Some examples may be realtime chat between friends, a basic computer game or media/audio streaming. You are free to use web sockets as you wish but you must include 1 web sockets app in your application.",
    "Features Completed:"
        "\n(1) Users may register and login to their account with an email and password."
        "\n(2) Email, username, password, profile image, date joined and last login date of user is stored in the database."
        "\n(3) User may post status on their home page and it can be viewed only by themselves or their friends. Post may or may not include an image but must have captions or texts written."
        "\n(4) User may search for other users via the search bar."
        "\n(5) Users may view a list of their friends and chats with them."
        "\n(6) Users may start a new chat with friends. Past messages will be displayed."
        "\n(7) User and friend list API written. Nested serializers used to display list of friends of a specific user.",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Advanced-Web-Development-Final-Coursework",
    "Future Improvements:"
        "\n(1) Use of websocket to enable async messages between friends. The current issue faced is that I am unable to display past messages despite the websocket private chat rooms being implemented successfully. How I would usually pass data using Objects.get() method does not work with the HTML codes for websocket private chat."
        "\n(2) When users update their profile image, it seems that the image does not update itself but when the web browser cache is cleared, the profile image updates to the correct image. Not sure if there is any solution for the cache to be cleared automatically when user updates the profile image."
        "\n(3) Resizing and recropping of images in application can be implemented to better standardize image size and ratio. Currently, images are forcibly resized to the size defined by the style of the element in HTML file."
        "\n(4) Infinite scrolling with pagination to improve home page loading performance as the number of data can be very large.",
    [
      "assets/images/projects/social-net-app/registration-page",
      "assets/images/projects/social-net-app/home-page",
      "assets/images/projects/social-net-app/home-page-2",
      "assets/images/projects/social-net-app/search-user-kwargs-b",
      "assets/images/projects/social-net-app/self-profile-page",
      "assets/images/projects/social-net-app/friend-list-page",
      "assets/images/projects/social-net-app/friend-profile-page",
      "assets/images/projects/social-net-app/chat-list-page",
      "assets/images/projects/social-net-app/chat-page",
      "assets/images/projects/social-net-app/friend-detail-api",
    ],
  ),
  Project(
    "Portfolio Website 1 (HTML/CSS/JS)",
    "Portfolio Website 1",
    ["Frontend"],
    ["HTML/CSS", "JavaScript"],
    ["Web/Mobile"],
    "Project Description:"
        "\n\nA personal portfolio website completed with the help of some online tutorial guides. Includes SVG + CSS animation. Javascript for state management and navigation.",
    "",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/portfolio-website",
    "",
    [
      "assets/images/projects/portfolio-website/home-section",
    ],
  ),
  Project(
    "Speech Recognition System (Mozilla DeepSpeech)",
    "Speech Recognition System",
    ["Others"],
    ["Python"],
    ["Web/Mobile"],
    "Project Description:"
        "\n\nA software development company has contacted you to create a speech recognition system to integrate in a Python project they are developing. In particular, the project consists of an airport virtual assistant."
        "\n\nRequirements:"
        "\n(1) Base the speech recognition system on the Mozilla DeepSpeech software package."
        "\n(2) Capable of language-selection, at the very least compatible with the following languages: English, Italian and Spanish."
        "\n(3) The airport virtual assistant will be installed in an environment that can be extremely noisy. So, the speech recognition system should be configured to be able to handle this situation. Your client gives you freedom for implementing any solution (for example, to configure in python a gain/amplification, low pass filter, or some other audio filter to improve the error rate)."
        "\n(4) The company has prepared a set of audio files with which you can evaluate the system. For this evaluation, you will test how well it recognises several phrases in each language. You also have to record and evaluate two short sentences (your_sentence1.wav and your_sentence2.wav). Feel free to prepare your own sentences",
    "Features Completed:"
        "\n(1) Console based application. Allows language selection by entering the language name. e.g. 'English', 'english' or 'en'."
        "\n(2) Mozilla DeepSpeech model and scorer is loaded in the application based on the language selected by user."
        "\n(3) Spectral subtraction and low pass filter applied to audio files to attempt to reduce background noise. Crowd noise used for spectral subtraction downloaded from: https://mixkit.co/free-sound-effects/crowd/ Librosa library load() and stft() function is used, along with numpy to load and transform the sample values into a subtractable form for spectral subtraction. Scipy library is used to perform low pass filter."
        "\n(4) Performance is evaluated by processing the predicted texts with the transcript texts. Overall performance result:"
        "\nEnglish word error rate(WER) of 18.84%, Spanish WER of 35.71% and Italian WER of 36.67",
    DateTime(2021, 12),
    "https://github.com/Kwang-Kian-Hui/Speech-Recognition-System--Mozilla-DeepSpeech-",
    "",
    [
      "assets/images/projects/mozilla-deepspeech/deepspeech-1",
      "assets/images/projects/mozilla-deepspeech/deepspeech-2",
      "assets/images/projects/mozilla-deepspeech/deepspeech-3",
      "assets/images/projects/mozilla-deepspeech/deepspeech-4",
    ],
  ),
  Project(
    "Audio Visualization with MeydaAnalyzer and Speech Recognition (p5.js)",
    "Audio Visualization with Speech Command",
    ["Others"],
    ["JavaScript"],
    ["Others"],
    "Project Description:"
        "\n\nDevelop an interactive web-based application for audio visualization. The application must be based on p5.js, p5.speech and the JavaScript audio feature extraction library Meyda."
        "\n\nRequirements:"
        "\n(1) Use audio features and map them to visual variables (shapes, size, etc.)."
        "\n(2) Voice control system, background color and shape changes.",
    "Features Completed:"
        "\n(1) Background color can be changed with voice command ('red', 'green', 'blue', 'black', 'white'). Color of shapes changes based on background color."
        "\n(2) Shape can be changed with voice command ('Square', 'Triangle', 'circle')."
        "\n(3) Audio features used: zcr, energy, Spectral Centroid, Spectral Flatness, SpectralSpread and Spectral Kurtosis, Spectral Rolloff."
        "They were chosen as the pitch and loudness of the audio file changes drastically throughout the duration of the audio, providing a better visual experience.",
    DateTime(2021, 12),
    "https://github.com/Kwang-Kian-Hui/Audio-Visualization-with-MeydaAnalyzer-and-Speech-Recognition-p5.js-",
    "",
    [
      "assets/images/projects/meyda/default-square",
      "assets/images/projects/meyda/red-circle",
      "assets/images/projects/meyda/white-circle",
    ],
  ),
  Project(
    "Video Format Converter with ffmpeg",
    "Video Format Converter",
    ["Others"],
    ["Python"],
    ["Others"],
    "Project Description:"
        "\n\nThe Narbonne Online Film Festival receives every year more than one hundred films in digital format. The problem is that some of these films are not submitted in the format specified by the festival organisation, and they must be converted. The organisation wants to automate this process by developing an application (exercise 3) for examining the format of the films and, if necessary, convert them."
        "\n\nRequirements:"
        "\n(1) The application must run on a Jupyter notebook written in Python, use ffprobe to examine the files, and ffmpeg to convert the films."
        "\n(2) From a series of video files, the application should generate a brief report in TXT indicating which films do not respect the digital format specified by the festival and what are the 'problematic' fields."
        "\n(3) The application should automatically convert the submitted films with an incorrect format. The program will create a new copy of the films by adding '_formatOK' at the end of the name. Specified format shown in first screenshot.",
    "Features Completed:"
        "\n(1) ffprobe used to examine video formats and txt file report generated correctly, indicating all problematic fields for each specific files."
        "\nffmpeg used to convert format of file into the specified format.",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/ffprobe--ffmpeg-Video-Format-Converter",
    "",
    [
      "assets/images/projects/ffprobe-ffmpeg-converter/converter_format",
      "assets/images/projects/ffprobe-ffmpeg-converter/converter_img_1",
      "assets/images/projects/ffprobe-ffmpeg-converter/converter_img_2",
    ],
  ),
  Project(
    "Location Alarm (Android, Flutter)",
    "Location Alarm (Flutter)",
    ["Frontend", "Data"],
    ["Dart"],
    ["Web/Mobile"],
    "Project Description:"
        "\n\nLocation Alarm is an app that allow users to create an alarm with a set destination and radius, and when their devices are within the radius of their destination, the alarm will ring. This app uses the Map and Places API of Google Cloud Platform for the map features and address suggestions when users are searching for their destination. Some android devices are unable to receive background location updates due to the device's battery saving processes."
        "\n\nKey Takeaways:"
        "\n(1) Usage of Google Map and Places APIs."
        "\n(2) Publishing app to Google Play Store for internal testing, and releasing for public use."
        "\nBackground location packages' limitations as the feature only works for certain android devices and a better solution is required.",
    "Features Completed:"
        "\n(1) Google Maps API (map features, markers, and positional radius)"
        "\n(2) Google Places API (search bar, address/postal/building name suggestions)"
        "\n(3) SQLite local device database"
        "\n(4) Alarm rings when device is within set radius of destination."
        "\n(5) Ringtone or vibrate"
    "\n\nApp can be downloaded from: https://play.google.com/store/apps/details?id=com.location_alarm"
    "\n\nVideo demo: https://www.youtube.com/watch?v=9kuAkN7wnuQ",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/location-alarm_v2",
    "Future Improvements:"
        "\n(1) Background location is not yet released. An additional change to the app where a prominent disclosure before the app's runtime is required to adhere to Google permissions policy in order for the update to be released. Without this, the location does not update when the screen is locked.",
    [
      "assets/images/projects/location-alarm/initial-page-permission-request",
      "assets/images/projects/location-alarm/add-edit-alarm-page",
      "assets/images/projects/location-alarm/home-page-with-alarms",
    ],
  ),
  Project(
    "DEALL (Android, Flutter)",
    "DEALL (Flutter)",
    ["Frontend", "Data"],
    ["Dart"],
    ["Web/Mobile"],
    "Project Description:"
        "\n\nDEALL is a mobile platform that allow food retailers to list their surplus food on discount, while consumers can view them, with the goal of reducing food waste in the process."
        "\n\nWork done by me in this group assignment:"
        "\n(1) Low fidelity and High fidelity prototyping using Figma"
        "\n(2) application logic for consumer's home page which displays the list of retailers available by calling Google Firestore conditional queries."
        "\n(3) add product feature for retailers where they will fill up a form with input validations before adding the product data to Google Firestore."
        "\n(4) application logic for consumer's retailer product list and detail page which displays the list of products offered by the specific retailer that the user has selected and the retailer's detail when the 'show detail' button is pressed."
        "\n(5) other minor changes in the nature of bug fixes and feedback.",
    "Features Completed:"
        "\n(1) Google Maps API (map features, markers, and positional radius)"
        "\n(2) Google Places API (search bar, address/postal/building name suggestions)"
        "\n(3) SQLite local device database"
        "\n(4) Alarm rings when device is within set radius of destination."
        "\n(5) Ringtone or vibrate",
    DateTime(2021, 12),
    "https://github.com/sinhaugoh/DEALL",
    "",
    [
      "assets/images/projects/location-alarm/initial-page-permission-request",
      "assets/images/projects/location-alarm/add-edit-alarm-page",
      "assets/images/projects/location-alarm/home-page-with-alarms",
    ],
  ),
  Project(
    "p5.js Projects",
    "p5.js Projects",
    ["Frontend"],
    ["JavaScript"],
    ["Web/Mobile", "Others"],
    "Project Description:"
        "\n\nA series of assignments using p5.js to create games, animations or graphical effects."
        "\n\nProjects:"
        "\n(1) Solar System - graphical animations simulating a solar system"
        "\n(2) Asteroid Game Clone - gravity effect when near Earth, and collision for destroying asteroids"
        "\n(3) Angry Birds Game Clone - p5 physics"
        "\n(4) Noisy Grid - graphical animations based on mouse position"
        "\n(5) 3D Sin Animation - graphical animations"
        "\n(6) Average Face - generate new 'average' face based on multiple faces"
        "\n(7) Instagram Filters - various filters on image"
        "\n(8) Webcam Piano - movement detection through webcam and plays piano keynotes based on position of movement",
    "",
    DateTime(2021, 12),
    "https://github.com/Kwang-Kian-Hui/graphics-programming",
    "",
    [
      "assets/images/projects/graphics-programming/solarSystem",
      "assets/images/projects/graphics-programming/asteroidGameClone",
      "assets/images/projects/graphics-programming/angryBirdsGameClone",
      "assets/images/projects/graphics-programming/noisyGrid",
      "assets/images/projects/graphics-programming/3DSinAnimation",
      "assets/images/projects/graphics-programming/averageFace1",
      "assets/images/projects/graphics-programming/averageFace2",
      "assets/images/projects/graphics-programming/instagramFilter1",
      "assets/images/projects/graphics-programming/instagramFilter2",
    ],
  ),
  Project(
    "MerkelRexBot(C++) - Crypto Trading Bot",
    "Crypto Trading Bot",
    ["Others"],
    ["C++"],
    ["Predictive Analytics"],
    "Project Description:"
        "\n\nMerkelRexBot is a command-line UI exchange simulation which allows a human to carry out market analysis and trading activities such as bidding for and offering trades. However, it also has the capability to make trades in the place of human users. Linear regression was performed on a group of sample data to generate the prediction model. Trades will then be made based on the predictions.",
    "",
    DateTime(2021, 10),
    "https://github.com/Kwang-Kian-Hui/MerkelRex",
    "Future Improvements:"
    "\nConditions for making trades can be improved as bot stops making trades after the first time iteration due to the trading conditions not being met."
    "\nCode and csv data is available in Github",
    [
      "assets/images/projects/merkelrex/merkelrex-cover",
      "assets/images/projects/merkelrex/merkelrex-img-1",
      "assets/images/projects/merkelrex/merkelrex-img-2",
      "assets/images/projects/merkelrex/merkelrex-img-3",
    ],
  ),
  Project(
    "Otodecks(C++) - Music Library Mixer",
    "Crypto Trading Bot",
    ["Others"],
    ["C++"],
    ["Others"],
    "Project Description:"
        "\n\nA Music Library Mixer with custom GUI. Mp3 files may be loaded onto the track and we can search for tracks using the search bar. Allows 2 audio files to be played at the same time with controls such as play, stop, fast forward, back track, volume, speed, audio position, replay and looping.",
    "",
    DateTime(2021, 10),
    "",
    "",
    [
      "assets/images/projects/otodecks/otodecks-img-1",
      "assets/images/projects/otodecks/otodecks-img-2",
    ],
  ),
  Project(
    "Data Programming Research",
    "Data Analytics",
    ["Others"],
    ["Python"],
    ["Data Analytics"],
    "Project Description:"
        "\n\nThe project's research is on \"Correlation between key variables of the countries' happiness index and COVID-19 vaccinations\". 2 relevant csv data files were downloaded, and web scraping was performed with BeautifulSoup to extract key data. The dataframes were merged along with the web scraped data to form a single large dataframe. Data cleaning and transformation was then performed before analysis takes place. Bar chart, Sunburst chart and Heatmap charts were produced and analysed to construct my final findings.",
    "",
    DateTime(2021, 10),
    "",
    "",
    [
      "assets/images/projects/data-programming-research/web-scraping",
      "assets/images/projects/data-programming-research/bar-chart",
      "assets/images/projects/data-programming-research/sun-burst-chart",
      "assets/images/projects/data-programming-research/heatmap-chart",
    ],
  ),
  Project(
    "Multiclass Classification with KNN Cross Validation",
    "KNN Cross Validation",
    ["Others"],
    ["Python"],
    ["Data Analytics, Predictive Analytics"],
    "Project Description:"
        "\n\nIn this coursework, the Wine dataset (178 sample dataset that categorises 3 different types of Italian wine using 13 different features) is used."
        "We will need to present our own code that performs nested cross-validation and the k-nearest neighbour algorithm, build confusion matrices, and estimate distances between data samples."
        "\n\nSteps:"
        "\n1) Exploratory Data Analysis - columns, min/max/mean/sd per column, class distribution"
        "\n1.1) Data Visualisation - identify correlations between alcohol level, flavanoids, color_intensity and ash using sns pair grid correlation plot"
        "\n1.2) Exploratory Data Analysis under noise - Gaussian noise"
        "\n2 classifiers with least overlaps selected to build classifier"
        "\n\n2) Implementing KNN"
        "\nEuclidean/manhattan/chebyshev distance are calculated to identify K nearest neighbours using the 2 classifiers as data points."
        "\nDistances are sorted from smallest to largest. Odd number k number of neighbours used to make prediction."
        "\n\n3) Classifier Evaluation:"
        "\nAccuracy, precision, recall and f1 score calculated to evaluate classifier"
        "\nConfusion matrix built to visualise true/false positives and true/false negatives"
        "\n\n4) Nested Cross-validation using your implementation of KNN"
        "\nSplit data into 5 equal folds and cross validation conducted using different distance metrics.",
    "",
    DateTime(2022, 1),
    "https://github.com/Kwang-Kian-Hui/Machine-Learning-and-Neural-Networks",
    "",
    [
      "assets/images/projects/machine-learning-mid/correlation_plot",
      "assets/images/projects/machine-learning-mid/confusion_matrix",
      "assets/images/projects/machine-learning-mid/confusion_matrix_grouping",
      "assets/images/projects/machine-learning-mid/classifier_evaluation",
      "assets/images/projects/machine-learning-mid/summary_results",
    ],
  ),
  Project(
    "Multiclass Classification (Sign Language MNIST)",
    "Multiclass Classification with ML Models",
    ["Others"],
    ["Python"],
    ["Data Analytics"],
    "Project Description:"
        "\n\nIn this coursework, the Sign Language MNIST dataset (27455 training, 7172 testing dataset, 28x28 pixel image, 24 labels representing each alphabet where J and Z is not included as it requires motion (unable to represent in 1 image)) is used."
        "\n\n1) Data Preparation - Converting data into tensors:"
        "\nNormalize tensor values"
        "\n\n2) Develop baseline model and another model that performs better"
        "\nModels developed using tensorflow keras models"
        "\nLoss function of categorical crossentropy used to evaluate multiclass single-label classification."
        "\n\n3) Overfitting model:"
        "\nConvolution layers and max pooling used to reduce the spatial dimensions of the inputs (downsample) coming from the convolution layers."
        "\nMax pooling 2D is typically used for RGB images while 1D is typically used for audio and 3D for multiple images from video."
        "\n\n4) Finetuning Hyperparameters:"
        "\nBatch normalization is added to speed up the learning process. It does so by standardizing the inputs to a layer for each mini-batch and reduces the number of training epochs required to train networks."
        "\nDropout is added to prevent overfitting of the model."
        "\nRegularizer is added to reduce the error by fitting a function appropriately on the given training set and avoid overfitting."
        "\nFinal model achieved accuracy of 96.88%",
        "",
    DateTime(2022, 3),
    "https://github.com/Kwang-Kian-Hui/Machine-Learning-and-Neural-Network-Final-Coursework",
    "",
    [
      "assets/images/projects/machine-learning-final/dataset",
      "assets/images/projects/machine-learning-final/baseline",
      "assets/images/projects/machine-learning-final/overfit",
      "assets/images/projects/machine-learning-final/best",
    ],
  ),
];
