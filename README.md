📊✨ @USC R Statistics & Visualization 📈🎓

<p>This repo contains materials, assignments, and projects from the course. Dive in to explore the world of R programming, statistical analysis, and data visualization!</p>

<h3>📝 Important Notes on Key Statistical Concepts:</h3>

<ul>
  <li><strong>📊 Mean vs. Median:</strong><br>
      When the mean and median are significantly different, it indicates the presence of outliers in the sample, breaking the symmetry of the data.
  </li>
  <li><strong>📏 Quartiles vs. Percentiles</strong><br>
  </li>
  <li><strong>⚖️ Sample Variance vs. Population Variance:</strong><br>
      It is preferable to use sample variance (biased variance) over population variance. For large sample sizes, the difference becomes minimal.<br>
      In R, the <code>var</code> function calculates the sample variance, not the population variance.
  </li>
  <li><strong>📐 Interquartile Range (IQR):</strong><br>
      The IQR is the range between the first quartile (Q1) and the third quartile (Q3) within the dataset.
  </li>
  <li><strong>📉 Standard Deviation (SD):</strong><br>
      SD is defined as the square root of the average of the squared deviations from the mean.
  </li>
  <li><strong>🔄 Symmetric vs. Asymmetric Variables:</strong><br>
      <strong>Symmetric Variable:</strong> Data is evenly distributed around the mean.<br>
      <strong>Positive Skewness:</strong> The right tail is longer; mean > median.<br>
      <strong>Negative Skewness:</strong> The left tail is longer; mean < median.
  </li>
  <li><strong>🔗 Correlation vs. Causation:</strong><br>
      Correlation between two variables does not imply that one causes the other. It only indicates a relationship or association between them.
  </li>
  <li><strong>📊 Boxplots:</strong><br>
      Boxplots are useful for identifying outliers but do not show whether there are distinct groups within the data.
  </li>
  <li><strong>🔍 Biases:</strong><br>
      Biases can distort statistical analysis and can occur in data collection, sampling, or interpretation. Common types include selection bias, measurement bias, and confirmation bias.
  </li>
  <li><strong>📈 Normal Distribution vs. t-Distribution:</strong><br>
    The normal distribution is symmetrical and bell-shaped, used for large sample sizes.<br>
    The t-distribution is similar to the normal distribution but has heavier tails. This occurs because it accounts for additional variability due to estimating the population standard deviation from a small sample size, which introduces more error.
</li>
<li><strong>🔍 Dimensionality Reduction in Multivariate Analysis:</strong><br>
    In multivariate analysis, the number of observed variables can be high. The goal is to reduce the number of variables to a smaller set that still accurately describes the data.
</li>
<li><strong>📉 Coefficient of Determination (R²):</strong><br>
    The coefficient of determination of a regression model, commonly denoted as R², is the proportion of the variability in the variable Y explained by the regression model. It takes values between 0 and 1; the closer to 1, the closer the observations are to the fitted line.
</li>
<li><strong>🔧 Variable Selection Method:</strong><br>
    The variable selection method seeks a model that best fits the data while being as simple as possible.
</li>
<li><strong>🔄 Collinearity in Regression Models:</strong><br>
    A regression model suffers from collinearity when the explanatory variables are highly correlated with each other. Under these conditions, the model struggles to distinguish the effect of each variable on the response. In practice, collinearity is studied through the Variance Inflation Factor (VIF).
</li>
<li><strong>🔄 Multivariate Analysis and Dimensionality Reduction:</strong><br>
    In multivariate analysis, when we have many variables and want to reduce them, we use techniques like Principal Component Analysis (PCA). PCA transforms the original variables into new variables, called principal components, which are linear combinations of the original variables. These principal components maintain the same overall variability of the data but with fewer dimensions.
</li>
<li><strong>🔗 Agglomerative vs. Divisive Methods:</strong><br>
      <strong>Agglomerative Methods:</strong> Start with each individual as a separate cluster and merge them step by step until all individuals belong to a single group.<br>
      <strong>Divisive Methods:</strong> Start with a single group and divide it step by step until each individual forms its own group.
  </li>


</ul>

<h3>🔗 Links of Interest:</h3>
<ul>
  <li><a href="https://www.gapminder.org" target="_blank">Gapminder</a></li>
  <li><a href="https://colorbrewer2.org" target="_blank">ColorBrewer 2</a></li>
  <li><a href="https://www.r-graph-gallery.com" target="_blank">R Graph Gallery</a></li>
</ul>

## 📄 Licencia

Este proyecto está bajo la licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.
