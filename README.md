Hate Speech Detector

A Flask web app that classifies a piece of text into one of three categories using a classic NLP pipeline and a Decision Tree classifier.

Live demo: https://hate-speech-detector-2-g09g.onrender.com

What it does

You type a message into the web form and the app tells you whether it is:

Label	Meaning
Hate Speech Detected	Text containing hate speech
Offensive language detected	Offensive, but not hate speech
No Hate and Offensive Speech	Neither
How it works
Data: labeled_data.csv, tweets labeled with 3 classes (0 = hate speech, 1 = offensive, 2 = neither).
Text cleaning (clean()):
lowercase
remove URLs, HTML tags, text in square brackets, punctuation, newlines and words containing digits
remove English stopwords (NLTK)
stem words with the Snowball stemmer
Features: CountVectorizer (bag of words).
Model: DecisionTreeClassifier (scikit-learn), trained on a 67/33 train-test split (random_state=42).
Serving: Flask. / shows the form, /predict cleans the input, vectorizes it and returns the predicted label.

The model is trained when the app starts, so no separate model file is needed.

Tech stack

Python, Flask, scikit-learn, pandas, NumPy, NLTK, HTML.

Project structure
.
├── HateSpeech.py        # Flask app + model training
├── labeled_data.csv     # Training data
└── templates/
    └── index.html       # Web form and result page
Run locally
bash
git clone https://github.com/aashish951/hate-speech-detector.git
cd hate-speech-detector

pip install flask pandas numpy scikit-learn nltk

python HateSpeech.py

Open http://localhost:5000 in your browser. To use another port, set the PORT environment variable.

The first run downloads the NLTK stopwords list, so an internet connection is needed once.

Deployment
Render: deployed as a web service (link above).
AWS: also deployed on EC2 using Terraform as part of the aws-ha-web-app project (custom VPC, public/private subnets, NAT Gateway and an Application Load Balancer, with EC2 instances in private subnets).
Limitations
Bag-of-words features ignore word order and context, so sarcasm and indirect hate are hard to catch.
A single Decision Tree can overfit the training data.
Hate speech and merely offensive language are close to each other in this dataset, so the two classes can be confused.
Predictions reflect the biases of the training data and should not be used for real content moderation decisions.
Possible improvements
Compare against Logistic Regression, Linear SVM or a transformer model such as BERT
Use TF-IDF features and report precision, recall and F1 per class
Save the trained model to disk instead of retraining on every start
Author

Ashish - GitHub | LinkedIn