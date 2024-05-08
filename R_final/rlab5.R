# Load necessary packages
library(ggplot2)
library(dplyr)
library(plotly)

# Step 1: Read Titanic dataset
titanic <- read.csv("train.csv")

# Convert factor levels
titanic$Survived <- factor(titanic$Survived, levels = c("0", "1"))

# Step 2: Customise the charts
# Bar chart showing count of survivors by passenger class
bar_plot <- ggplot(titanic, aes(x = factor(Pclass), fill = factor(Survived))) +
  geom_bar(position = "dodge") +
  labs(title = "Survivors by Passenger Class",
       x = "Passenger Class",
       y = "Count",
       fill = "Survived") +
  scale_fill_manual(values = c("0" = "red", "1" = "blue"))  # Ensure consistent levels with the factor

# Line plot showing age distribution of passengers
line_plot <- ggplot(titanic, aes(x = Age, y = ..density..)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Age Distribution of Passengers",
       x = "Age",
       y = "Density")

# Scatter plot showing fare vs age with color indicating survival status
scatter_plot <- ggplot(titanic, aes(x = Age, y = Fare, color = factor(Survived))) +
  geom_point() +
  labs(title = "Fare vs Age",
       x = "Age",
       y = "Fare",
       color = "Survived") +
  scale_color_manual(values = c("0" = "red", "1" = "blue"))  # Ensure consistent levels with the factor

#heatmap
heatmap <- ggplot(titanic, aes(x = Pclass, y = Survived)) +
  stat_bin_2d(bins = 10, aes(fill = ..count..)) +
  labs(title = "Titanic Survival Heatmap", x = "Pclass", y = "Survived", fill = "Frequency") +
  scale_fill_continuous(name = "Frequency", low = "white", high = "blue") +
  theme_minimal()


# Step 3: Create interactive visualizations using plotly
# Interactive bar chart
interactive_bar_chart <- ggplotly(bar_plot)

# Interactive line plot
interactive_line_plot <- ggplotly(line_plot)

# Interactive scatter plot
interactive_scatter_plot <- ggplotly(scatter_plot)
#interactive heat map
interactive_heatr_plot <- ggplotly(heatmap)

# Step 4: Export interactive visualizations
# Export visualizations to png files
ggsave("C:\\Users\\kirthan\\Downloads\\rfinal\\bar_plot.png", plot = bar_plot, width = 8, height = 6)
ggsave("C:\\Users\\kirthan\\Downloads\\rfinal\\line_plot.png", plot = line_plot, width = 8, height = 6)
ggsave("C:\\Users\\kirthan\\Downloads\\rfinal\\scatter_plot.png", plot = scatter_plot, width = 8, height = 6)
ggsave("C:\\Users\\kirthan\\Downloads\\rfinal\\heatmap.png", heatmap, width = 8, height = 6)

# Export plotly interactive visualizations to HTML files
htmlwidgets::saveWidget(interactive_bar_chart, "C:\\Users\\kirthan\\Downloads\\rfinal\\interactive_bar_chart.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_line_plot, "C:\\Users\\kirthan\\Downloads\\rfinal\\interactive_line_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_scatter_plot, "C:\\Users\\kirthan\\Downloads\\rfinal\\interactive_scatter_plot.html", selfcontained = TRUE)
htmlwidgets::saveWidget(interactive_heatr_plot, file = "C:\\Users\\kirthan\\Downloads\\rfinal\\titanic_heatmap.html")
