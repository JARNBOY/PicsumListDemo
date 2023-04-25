//
//  ImageDetailViewController.swift
//  PicsumListDemo
//
//  Created by Papon Supamongkonchai on 24/4/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ImageDetailDisplayLogic: AnyObject
{
    func displayGetImageDetail(viewModel: ImageDetail.GetDetailDisplay.ViewModel)
    func displayGetBlurImage(imageBlur: UIImage)
    func displayGetGrayScaleImage(imageGrayScale: UIImage)
}

class ImageDetailViewController: UIViewController, ImageDetailDisplayLogic
{
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var blurSlider: UISlider!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var typeSegment: UISegmentedControl!
    
    var interactor: ImageDetailBusinessLogic?
    var router: (NSObjectProtocol & ImageDetailRoutingLogic & ImageDetailDataPassing)?
    
    private var segmentTypeSelected: SegmentType = .normal
    private var normalImage: UIImage? = nil
    private var blurImage: UIImage? = nil
    private var grayScaleImage: UIImage? = nil
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = ImageDetailInteractor()
        let presenter = ImageDetailPresenter()
        let router = ImageDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpView()
        getImageDetail()
    }
    
    // MARK: View
    private func setUpView() {
        blurSlider.isContinuous = false
        typeSegment.selectedSegmentIndex = segmentTypeSelected.rawValue
    }
    
    private func setUpSegmentView() {
        switch segmentTypeSelected {
        case .normal:
            self.setImage(image: self.normalImage)
            blurSlider.isHidden = true
            break
        case .blur:
            self.setImage(image: self.blurImage)
            blurSlider.isHidden = false
            break
        case .grayScale:
            self.setImage(image: self.grayScaleImage)
            blurSlider.isHidden = true
            break
        }
        
        
    }
    
    private func setImage(image: UIImage?) {
        if let img = image {
            self.detailImageView.image = img
        }
    }
    
    // MARK: Function
    func getImageDetail() {
        interactor?.getImageDetail()
    }
    
    // MARK: Event UI Action
    
    @IBAction func typeSegment_click(_ sender: UISegmentedControl) {
        segmentTypeSelected = sender.selectedSegmentIndex.toSegmentType()
        if segmentTypeSelected == .blur && blurImage == nil {
            self.interactor?.getBlurImage(blur: Double(blurSlider.value))
        } else if segmentTypeSelected == .grayScale && grayScaleImage == nil {
            self.interactor?.getGrayScaleImage()
        }
        setUpSegmentView()
    }
    
    @IBAction func blurSlider_action(_ sender: UISlider) {
        blurImage = nil
        self.interactor?.getBlurImage(blur: Double(sender.value))
    }
    // MARK: ImageDetailDisplayLogic
    func displayGetImageDetail(viewModel: ImageDetail.GetDetailDisplay.ViewModel) {
        DispatchQueue.main.async {
            self.normalImage = UIImage(data: viewModel.imageData)
            self.lblAuthor.text = viewModel.author
            self.descTextView.text = viewModel.desc
            self.setUpSegmentView()
        }
    }
    
    func displayGetBlurImage(imageBlur: UIImage) {
        DispatchQueue.main.async {
            self.blurImage = imageBlur
            self.setImage(image: self.blurImage)
            self.setUpSegmentView()
        }
        
    }
    
    func displayGetGrayScaleImage(imageGrayScale: UIImage) {
        DispatchQueue.main.async {
            self.grayScaleImage = imageGrayScale
            self.setImage(image: self.grayScaleImage)
            self.setUpSegmentView()
        }
        
    }
    
}
