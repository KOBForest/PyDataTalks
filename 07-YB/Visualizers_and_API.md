
yellowbrick


Visualizers and API

Welcome to the API documentation for Yellowbrick! This section contains a complete listing of the currently available, production-ready visualizers along with code examples of how to use them. You may use the following links to navigate to the reference material for each visualization.

    Example Datasets
    Anscombe’s Quartet
        API Reference
###    Feature Analysis Visualizers
        RadViz Visualizer
        Rank Features
        Parallel Coordinates
        PCA Projection
        Manifold Visualization
        Feature Importances
        Recursive Feature Elimination
        Direct Data Visualization
###    Target Visualizers
        Balanced Binning Reference
        Class Balance
        Feature Correlation
###    Regression Visualizers
        Residuals Plot
        Prediction Error Plot
        Alpha Selection
###    Classification Visualizers
        Classification Report
        Confusion Matrix
        ROCAUC
        Precision-Recall Curves
        Class Prediction Error
        Discrimination Threshold
 ###   Clustering Visualizers
        Elbow Method
        Silhouette Visualizer
        Intercluster Distance Maps
 ###   Model Selection Visualizers
        Validation Curve
        Learning Curve
        Cross Validation Scores
    Text Modeling Visualizers
        Loading a Text Corpus
        Token Frequency Distribution
        t-SNE Corpus Visualization
        Dispersion Plot
    Yellowbrick Contrib
        DecisionBoundaries Vizualizer
        StatsModels Visualizers
        Scatter Plot Visualizer
        Missing Values
    Colors and Style
        Color Palettes
        Color Sequences
        API Reference

Note

Many examples utilize data from the UCI Machine Learning repository. In order to run the accompanying code, make sure to follow the instructions in Example Datasets to download and load the required data.

A guide to finding the visualizer you’re looking for: generally speaking, visualizers can be data visualizers which visualize instances relative to the model space; score visualizers which visualize model performance; model selection visualizers which compare multiple model forms against each other; and application specific-visualizers. This can be a bit confusing, so we’ve grouped visualizers according to the type of analysis they are well suited for.

Feature analysis visualizers are where you’ll find the primary implementation of data visualizers. Regression, classification, and clustering analysis visualizers can be found in their respective libraries. Finally, visualizers for text analysis are also available in Yellowbrick! Other utilities, such as styles, best fit lines, and Anscombe’s visualization, can also be found in the links above.
