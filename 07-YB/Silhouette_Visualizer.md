

Docs » Visualizers and API » Clustering Visualizers » Silhouette Visualizer 
 Edit on GitHub 

Silhouette Visualizer
The Silhouette Coefficient is used when the ground-truth about the dataset is unknown and computes the density of clusters computed by the model. The score is computed by averaging the silhouette coefficient for each sample, computed as the difference between the average intra-cluster distance and the mean nearest-cluster distance for each sample, normalized by the maximum value. This produces a score between 1 and -1, where 1 is highly dense clusters and -1 is completely incorrect clustering.
The Silhouette Visualizer displays the silhouette coefficient for each sample on a per-cluster basis, visualizing which clusters are dense and which are not. This is particularly useful for determining cluster imbalance, or for selecting a value for 
K
K
by comparing multiple visualizers.
from sklearn.datasets import make_blobs

# Make 8 blobs dataset
X, y = make_blobs(centers=8)
from sklearn.cluster import MiniBatchKMeans

from yellowbrick.cluster import SilhouetteVisualizer

# Instantiate the clustering model and visualizer
model = MiniBatchKMeans(6)
visualizer = SilhouetteVisualizer(model)

visualizer.fit(X) # Fit the training data to the visualizer
visualizer.poof() # Draw/show/poof the data
 
API Reference
Implements visualizers that use the silhouette metric for cluster evaluation.
class yellowbrick.cluster.silhouette.SilhouetteVisualizer(model, ax=None, **kwargs)[source]
Bases: yellowbrick.cluster.base.ClusteringScoreVisualizer
The Silhouette Visualizer displays the silhouette coefficient for each sample on a per-cluster basis, visually evaluating the density and separation between clusters. The score is calculated by averaging the silhouette coefficient for each sample, computed as the difference between the average intra-cluster distance and the mean nearest-cluster distance for each sample, normalized by the maximum value. This produces a score between -1 and +1, where scores near +1 indicate high separation and scores near -1 indicate that the samples may have been assigned to the wrong cluster.
In SilhouetteVisualizer plots, clusters with higher scores have wider silhouettes, but clusters that are less cohesive will fall short of the average score across all clusters, which is plotted as a vertical dotted red line.
This is particularly useful for determining cluster imbalance, or for selecting a value for K by comparing multiple visualizers.


### Parameters:
model : a Scikit-Learn clusterer
Should be an instance of a centroidal clustering algorithm (KMeans or MiniBatchKMeans).
ax : matplotlib Axes, default: None
The axes to plot the figure on. If None is passed in the current axes will be used (or generated if required).
kwargs : dict
Keyword arguments that are passed to the base class and may influence the visualization as defined in other Visualizers.

#### Examples
>>> from yellowbrick.cluster import SilhouetteVisualizer
>>> from sklearn.cluster import KMeans
>>> model = SilhouetteVisualizer(KMeans(10))
>>> model.fit(X)
>>> model.poof()


#### Attributes:
silhouette_score_ : float
Mean Silhouette Coefficient for all samples. Computed via scikit-learn sklearn.metrics.silhouette_score.
silhouette_samples_ : array, shape = [n_samples]
Silhouette Coefficient for each samples. Computed via scikit-learn sklearn.metrics.silhouette_samples.
n_samples_ : integer
Number of total samples in the dataset (X.shape[0])
n_clusters_ : integer
Number of clusters (e.g. n_clusters or k value) passed to internal scikit-learn model.
draw(labels)[source]
Draw the silhouettes for each sample and the average score.


#### Parameters:
labels : array-like
An array with the cluster label for each silhouette sample, usually computed with predict(). Labels are not stored on the visualizer so that the figure can be redrawn with new data.
finalize()[source]
Prepare the figure for rendering by setting the title and adjusting the limits on the axes, adding labels and a legend.
fit(X, y=None, **kwargs)[source]
Fits the model and generates the silhouette visualization.
 
