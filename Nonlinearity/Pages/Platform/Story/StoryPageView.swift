//
//  StoryPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 26/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class StoryPageView: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    var story: StoryModel?
    
    let image = StoryImageView()
    let rating = RatingView()
    let views = ViewsView()
    
    let editorChoice = UILabel()
    let titleStory = UILabel()
    let author = UILabel()
    
    let genres = GenresView()
    
    let publishedDate = UILabel()
    let descriptionView = DescriptionView()
    
    let backView = UIView()
    
    let buttonRead = ButtonView()
    
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x252525)
        self.setNeedsStatusBarAppearanceUpdate()
        
    }
    
    func dataLoaded() {
        editorChoiceSetup()
        networkManager.getAvatarStoryData(avatarStoryPath: story!.image!) { (data) in
            DispatchQueue.main.async {
                if !data!.isEmpty {
                    self.image.image = UIImage(data: data!)
                }
            }
            return
        }
        
        if story!.rating! > 8 {
            image.setRate()
        }
        if story!.editorChoice! {
            image.setFirstRate()
            editorChoice.isHidden = false
        }
        
        rating.text = story!.rating!
        views.text = story!.views!
        
        titleStorySetup()
        authorSetup()
        
        genres.setGenres(newGenres: story!.genres!)
        
        publishedDateSetup()
        
        descriptionView.text = story!.description!

        backView.backgroundColor = .hex(rgb: 0x191919)
        buttonSetup()
        
        [image, rating, views, editorChoice, titleStory, author, genres, publishedDate, descriptionView, backView, buttonRead].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        setConstraint()
    }
    
    func setConstraint() {
        
        let width = UIScreen.main.bounds.size.width / 2.76
        let height = width / 0.73
        let anchorsImage = (UIScreen.main.bounds.size.width - width) / 2
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                           constant: anchorsImage),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                            constant: anchorsImage * (-1)),
            image.heightAnchor.constraint(equalToConstant: height),
        ])
        
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                        constant: (height/2 + 55)),
            rating.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                            constant: 30),
            rating.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -30),
            rating.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            views.topAnchor.constraint(equalTo: rating.topAnchor),
            views.leadingAnchor.constraint(equalTo: image.trailingAnchor,
                                            constant: 30),
            views.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            views.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            editorChoice.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            editorChoice.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            editorChoice.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleStory.topAnchor.constraint(equalTo: editorChoice.bottomAnchor, constant: 15),
            titleStory.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            titleStory.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: titleStory.bottomAnchor, constant: 2),
            author.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            author.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            genres.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 10),
            genres.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            genres.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            genres.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        NSLayoutConstraint.activate([
            publishedDate.topAnchor.constraint(equalTo: genres.bottomAnchor, constant: 30),
            publishedDate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            publishedDate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: publishedDate.bottomAnchor, constant: 40),
            descriptionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: descriptionView.getHeight())
        ])
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 75),
            backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        let anchorsButton = (UIScreen.main.bounds.size.width - 200) / 2
        
        NSLayoutConstraint.activate([
            buttonRead.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 50),
            buttonRead.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: anchorsButton),
            buttonRead.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: anchorsButton * (-1)),
            buttonRead.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

extension StoryPageView {
    private func editorChoiceSetup() {
        editorChoice.text = "Выбор редакции"
        editorChoice.textAlignment = .center
        editorChoice.textColor = .hex(rgb: 0xE5C657)
        editorChoice.font = .boldSystemFont(ofSize: 16)
        
        editorChoice.isHidden = true
    }
    
    private func titleStorySetup() {
        titleStory.text = story!.title
        titleStory.textAlignment = .center
        titleStory.textColor = .hex(rgb: 0xF1F1F1)
        titleStory.font = .boldSystemFont(ofSize: 25)
    }
    
    private func authorSetup() {
        author.text = story!.author
        author.textAlignment = .center
        author.textColor = .hex(rgb: 0x949494)
        author.font = .systemFont(ofSize: 17)
    }
    
    private func publishedDateSetup() {
        publishedDate.text = "Вышло"
        publishedDate.textAlignment = .center
        publishedDate.textColor = .hex(rgb: 0xAEAEAE)
        publishedDate.font = .systemFont(ofSize: 17)
    }
    
    private func buttonSetup() {
        buttonRead.backgroundColor = .hex(rgb: 0x8D4086)
        buttonRead.layer.cornerRadius = 17
        buttonRead.setTitle("Читать", for: .normal)
        buttonRead.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
        networkManager.getStoryDataJSON(storyPath: story!.storyPath!) { [self] data in
            let str = String(decoding: data!, as: UTF8.self)
            print(str)
            
            DispatchQueue.main.async {
                let chatView = ChatScreenViewController()
                let chatJSON = try! JSONDecoder().decode(ChatJSON.self, from: data!)
                let chatModel = ChatLoader().load(from: chatJSON)!
                chatModel.title = self.story!.title!
                
                let presenter = ChatScreenPresenter(model: chatModel, view: chatView.screenView)
                
                chatView.modalPresentationStyle = .fullScreen
                chatView.modalTransitionStyle = .crossDissolve
                
                self.dismiss(animated: false, completion: nil)
                self.view.window!.rootViewController!.present(chatView, animated: false, completion: nil)
//                self.present(chatView, animated: true, completion: nil)
                
                presenter.show()
            }
        }
    }
}
