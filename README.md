# HorizontalCenteredCollectionView
A custom horizontal CollectionView layout that displays previous and next pages, and centers the current page.

Uses scrollViewWillEndDragging to cancel scrolling multiple items at once and determine whether to advance to the next page based on the scrolling velocity.

If using iOS 13 or later, this can be achieved with UICollectionViewCompositionalLayout.

https://user-images.githubusercontent.com/28383179/233114973-b29be7cd-7cd5-44eb-bae0-357a382ffc8d.mp4
