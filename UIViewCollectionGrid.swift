import UIKit 
class CollectionViewController : UIViewController , UICollectionViewDelegateFlowLayout {    
    @IBOutlet weak var mCollectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(
      top: 0,
      left: 10,
      bottom: 0,
      right: 5)
    let itemsPerRow: CGFloat = 3
    func collectionView(
       _ collectionView: UICollectionView,
       layout collectionViewLayout: UICollectionViewLayout,
       sizeForItemAt indexPath: IndexPath
     ) -> CGSize {
       let paddingSpace = sectionInsets.left * itemsPerRow
       let availableWidth = mCollectionView.frame.width - paddingSpace
       let widthPerItem = availableWidth / itemsPerRow
       
       return CGSize(width: widthPerItem, height: widthPerItem)
     }
     
     func collectionView(
       _ collectionView: UICollectionView,
       layout collectionViewLayout: UICollectionViewLayout,
       insetForSectionAt section: Int
     ) -> UIEdgeInsets {
       return sectionInsets
     }
     
     func collectionView(
       _ collectionView: UICollectionView,
       layout collectionViewLayout: UICollectionViewLayout,
       minimumLineSpacingForSectionAt section: Int
     ) -> CGFloat {
       return sectionInsets.left
     }
}
