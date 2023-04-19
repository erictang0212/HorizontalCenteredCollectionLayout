# HorizontalCenteredCollectionView
A custom horizontal CollectionView layout that displays previous and next pages, and centers the current page.

Uses scrollViewWillEndDragging to cancel scrolling multiple items at once and determine whether to advance to the next page based on the scrolling velocity.

If using iOS 13 or later, this can be achieved with UICollectionViewCompositionalLayout.


![Simulator_Screen_Recording_-_iPhone_14_-_2023-04-19_at_22_47_40_AdobeExpress-2](https://user-images.githubusercontent.com/28383179/233116858-59183f88-470b-477f-8df3-e727f7d6b294.gif)
