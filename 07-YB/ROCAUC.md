

Docs » Visualizers and API » Classification Visualizers » ROCAUC 


ROCAUC
A ROCAUC (Receiver Operating Characteristic/Area Under the Curve) plot allows the user to visualize the tradeoff between the classifier’s sensitivity and specificity.
The Receiver Operating Characteristic (ROC) is a measure of a classifier’s predictive quality that compares and visualizes the tradeoff between the model’s sensitivity and specificity. When plotted, a ROC curve displays the true positive rate on the Y axis and the false positive rate on the X axis on both a global average and per-class basis. The ideal point is therefore the top-left corner of the plot: false positives are zero and true positives are one.
This leads to another metric, area under the curve (AUC), which is a computation of the relationship between false positives and true positives. The higher the AUC, the better the model generally is. However, it is also important to inspect the “steepness” of the curve, as this describes the maximization of the true positive rate while minimizing the false positive rate.
<pre><code>
from sklearn.model_selection import train_test_split

# Load the classification data set
data = load_data("occupancy")

# Specify the features of interest and the classes of the target
features = ["temperature", "relative humidity", "light", "C02", "humidity"]
classes = ["unoccupied", "occupied"]

# Extract the instances and target
X = data[features]
y = data.occupancy

# Create the train and test data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
from yellowbrick.classifier import ROCAUC
from sklearn.linear_model import LogisticRegression

# Instantiate the visualizer with the classification model
visualizer = ROCAUC(LogisticRegression(), classes=classes)

visualizer.fit(X_train, y_train)  # Fit the training data to the visualizer
visualizer.score(X_test, y_test)  # Evaluate the model on the test data
g = visualizer.poof()             # Draw/show/poof the data
 
</code></pre> 
Warning
Binary classification using a Scikit-learn-style estimator with only a decision_function, triggers an IndexError because the predictions will be a 1D array, meaning there is only sufficient information to plot a single curve. More on this bug can be found in this notebook. The bug was addressed in a July 2018 PR and will be fixed in v0.9, where the solution will be to set the micro, macro, and per-class parameters of ROCAUC to False.
Multi-class ROCAUC Curves
Yellowbrick’s ROCAUC Visualizer does allow for plotting multiclass classification curves. ROC curves are typically used in binary classification, and in fact the Scikit-Learn roc_curve metric is only able to perform metrics for binary classifiers. Yellowbrick addresses this by binarizing the output (per-class) or to use one-vs-rest (micro score) or one-vs-all (macro score) strategies of classification.
<pre><code>
# Load multi-class classification dataset
game = load_game()

classes = ["win", "loss", "draw"]

# Encode the non-numeric columns
game.replace({'loss':-1, 'draw':0, 'win':1, 'x':2, 'o':3, 'b':4}, inplace=True)

# Extract the instances and target
X = game.iloc[:, game.columns != 'outcome']
y = game['outcome']

# Create the train and test data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
from sklearn.linear_model import RidgeClassifier

visualizer = ROCAUC(RidgeClassifier(), classes=classes)

visualizer.fit(X_train, y_train)  # Fit the training data to the visualizer
visualizer.score(X_test, y_test)  # Evaluate the model on the test data
g = visualizer.poof()             # Draw/show/poof the data
</code></pre>
By default with multi-class ROCAUC visualizations, a curve for each class is plotted, in addition to the micro- and macro-average curves for each class. This enables the user to inspect the tradeoff between sensitivity and specificity on a per-class basis. Note that for multi-class ROCAUC, at least one of the micro, macro, or per_class parameters must be set to True (by default, all are set to True).
 
### API Reference
Implements visual ROC/AUC curves for classification evaluation.
class yellowbrick.classifier.rocauc.ROCAUC(model, ax=None, classes=None, micro=True, macro=True, per_class=True, **kwargs)[source]
Bases: yellowbrick.classifier.base.ClassificationScoreVisualizer
Receiver Operating Characteristic (ROC) curves are a measure of a classifier’s predictive quality that compares and visualizes the tradeoff between the models’ sensitivity and specificity. The ROC curve displays the true positive rate on the Y axis and the false positive rate on the X axis on both a global average and per-class basis. The ideal point is therefore the top-left corner of the plot: false positives are zero and true positives are one.
This leads to another metric, area under the curve (AUC), a computation of the relationship between false positives and true positives. The higher the AUC, the better the model generally is. However, it is also important to inspect the “steepness” of the curve, as this describes the maximization of the true positive rate while minimizing the false positive rate. Generalizing “steepness” usually leads to discussions about convexity, which we do not get into here.


Parameters:
model : estimator
Must be a classifier, otherwise raises YellowbrickTypeError
ax : matplotlib Axes, default: None
The axes to plot the figure on. If None is passed in the current axes will be used (or generated if required).
classes : list
A list of class names for the legend. If classes is None and a y value is passed to fit then the classes are selected from the target vector. Note that the curves must be computed based on what is in the target vector passed to the score() method. Class names are used for labeling only and must be in the correct order to prevent confusion.
micro : bool, default = True
Plot the micro-averages ROC curve, computed from the sum of all true positives and false positives across all classes. Micro is not defined for binary classification problems with estimators with only a decision_function method.
macro : bool, default = True
Plot the macro-averages ROC curve, which simply takes the average of curves across all classes. Macro is not defined for binary classification problems with estimators with only a decision_function method.
per_class : bool, default = True
Plot the ROC curves for each individual class. This should be set to false if only the macro or micro average curves are required. Per- class classification is not defined for binary classification problems with estimators with only a decision_function method.
kwargs : keyword arguments passed to the super class.
Currently passing in hard-coded colors for the Receiver Operating Characteristic curve and the diagonal. These will be refactored to a default Yellowbrick style.

#### Notes
ROC curves are typically used in binary classification, and in fact the Scikit-Learn roc_curve metric is only able to perform metrics for binary classifiers. As a result it is necessary to binarize the output or to use one-vs-rest or one-vs-all strategies of classification. The visualizer does its best to handle multiple situations, but exceptions can arise from unexpected models or outputs.
Another important point is the relationship of class labels specified on initialization to those drawn on the curves. The classes are not used to constrain ordering or filter curves; the ROC computation happens on the unique values specified in the target vector to the score method. To ensure the best quality visualization, do not use a LabelEncoder for this and do not pass in class labels.
See also
http://scikit-learn.org/stable/auto_examples/model_selection/plot_roc.html
Examples
</pre></code>
>>> from yellowbrick.classifier import ROCAUC
>>> from sklearn.linear_model import LogisticRegression
>>> from sklearn.model_selection import train_test_split
>>> data = load_data("occupancy")
>>> features = ["temp", "relative humidity", "light", "C02", "humidity"]
>>> X_train, X_test, y_train, y_test = train_test_split(X, y)
>>> oz = ROCAUC(LogisticRegression())
>>> oz.fit(X_train, y_train)
>>> oz.score(X_test, y_test)
>>> oz.poof()
</code></pre>

Attributes:
score_ : float
Global accuracy score, unless micro or macro scores are requested
draw()[source]
Renders ROC-AUC plot. Called internally by score, possibly more than once


Returns:
ax : the axis with the plotted figure

finalize(**kwargs)[source]
Finalize executes any subclass-specific axes finalization steps. The user calls poof and poof calls finalize.


Parameters:
kwargs: generic keyword arguments.

score(X, y=None, **kwargs)[source]
Generates the predicted target values using the Scikit-Learn estimator.


Parameters:
X : ndarray or DataFrame of shape n x m
A matrix of n instances with m features
y : ndarray or Series of length n
An array or series of target or class values
Returns:
score_ : float
Global accuracy unless micro or macro scores are requested.

