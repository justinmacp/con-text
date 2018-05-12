## con-text
# Motivation
In this day and age an abundance of choices and an overload of information is an ever-growing problem for many. At the moment, there is a growth in content description algorithms for image, audio and video data such as the MPEG 7. Such algorithms aim to describe content, so that it can be labeled for the purpose of training intelligent systems and so that search engines can respond to queries related to such a descriptor. There is not much development in the field of content descriptors for literary works. We have decided to create a content description scheme for literary works using book reviews.

# How to use
To perform all downloads from the database and perform preprocessing and the GloVe model run: 
  ./demo.sh
To extract Stanford Dependency Tree and calculate scores run:
  ./batch_score_calc.sh
To test your results run:
  python testing.py
  
