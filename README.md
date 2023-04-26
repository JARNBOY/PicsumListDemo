# PicsumListDemo
This Project follow requriement from email.

First I choose pattern Clean Swift (VIP Architecture) for write this app.

In part of about file Manager I create 2 file for support process load and request API -> APIManager and ImageLoaderManager

I try manage ARC memmory by try keep or cache Image is Data type, 
When need display Image I will change Data to UIImage and when load image url try use URLSession for load like asynchonous 
Then if scrolldown to last index image in collectionView I will clear imageCache for retain safe memmory

Then I create page two page follow behavior requirement.

ImageListView (List page)

<img width="897" alt="Screenshot 2566-04-26 at 14 57 43" src="https://user-images.githubusercontent.com/51109993/234508855-1d2170a1-731a-4d9b-bad1-caa18079cbf7.png">

ImageDetailView (Image page)

<img width="937" alt="Screenshot 2566-04-26 at 14 58 22" src="https://user-images.githubusercontent.com/51109993/234509035-11327480-f89e-42f3-9334-b3d2e00060d3.png">

(Link Figma description design: https://www.figma.com/file/pa4LYTdmP6uQiGySm1Xs7n/PicsumDemo-Design-Structure?node-id=0-1&t=MdwJVEnBnF4MPHwY-0)



