//
//  Lab4uButton.swift
//
//
//  Created by Artem Pavlov on 15.05.2024.
//

import UIKit.UIControl

/// Custom button view
public final class Lab4uButton: UIButton {

  // MARK: - Internal properties

  public var style: Style? {
    didSet {
      set(style: style)
    }
  }

  // MARK: - Private properties

  private var buttonAction: (() -> Void)?

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)

    configureLayout()
    applyDefaultBehavior()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Internal Methods

  /// Setup view
  /// - Parameters:
  /// - buttonTitle: button title text
  /// - buttonAction: button action
  public func configureWith(buttonTitle: String?,
                     buttonStyle: Style = .blue,
                     buttonAction: (() -> Void)? = nil) {
    setTitle(buttonTitle, for: .normal)
    set(style: buttonStyle)
    self.buttonAction = buttonAction
  }

  public func changeAppearance(newBackgroundColor: UIColor,
                        textColor: UIColor,
                        borderColor: UIColor,
                        borderWidth: CGFloat) {
    backgroundColor = newBackgroundColor
    setTitleColor(textColor, for: .normal)
    layer.borderColor = borderColor.cgColor
    layer.borderWidth = borderWidth
  }
}

// MARK: - Private Methods

private extension Lab4uButton {

  func configureLayout() {
    let appearance = Appearance()

//    snp.makeConstraints {
//      $0.height.equalTo(appearance.buttonHeight)
//    }

//    NSLayoutConstraint.activate([
//      heightAnchor.constraint(equalToConstant: appearance.buttonHeight)
//    ])
  }

  func applyDefaultBehavior() {
    addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }

  func set(style: Style?) {
    let appearance = Appearance()

    guard let style else { return }

    switch style {
    case .white:
//      backgroundColor = appearance.whiteButtonColor
//      setTitleColor(appearance.whiteButtonTittleColor, for: .normal)
//      titleLabel?.font = appearance.titleLabelFont
      setBorder()
      isEnabled = true
    case .blue:
//      backgroundColor = appearance.blueButtonColor
//      setTitleColor(appearance.blueButtonTittleColor, for: .normal)
      isEnabled = true
    case .notActive:
//      backgroundColor = appearance.lightGrayColor
//      setTitleColor(appearance.notActiveButtonColor, for: .normal)
      isEnabled = false
    case .lightGray:
//      backgroundColor = appearance.inactiveButtonColor
//      setTitleColor(appearance.buttonTextColor, for: .normal)
      isEnabled = false
//      titleLabel?.font = appearance.titleLabelFont
      layer.borderWidth = 0
    case .orange:
//      backgroundColor = appearance.orangeButtonColor
//      setTitleColor(appearance.whiteButtonColor, for: .normal)
      isEnabled = true
      layer.borderWidth = 0

    case .simpleWhite:
//      backgroundColor = appearance.whiteButtonColor
      setTitleColor(.gray, for: .normal)
    //  titleLabel?.font = lab4uFont.robotoRegular14

    case .simpleBlue:
//      backgroundColor = appearance.blueButtonColor
      setTitleColor(.white, for: .normal)
    //  titleLabel?.font = lab4uFont.robotoRegular14

    }

    layer.cornerRadius = appearance.buttonCornerRadius
    clipsToBounds = true
  }

  func setBorder() {
    let appearance = Appearance()
    layer.borderWidth = appearance.boarderWidth
    layer.borderColor = appearance.lightGrayColor.cgColor
  }

  @objc
  func buttonTapped() {
    buttonAction?()
  }
}

// MARK: - Appearance

private extension Lab4uButton {
  struct Appearance {
//    let titleLabelFont: UIFont = lab4uFont.robotoMedium16
//    let blueButtonColor: UIColor = lab4uColor.primaryBlue
//    let whiteButtonColor: UIColor = lab4uColor.primaryWhite
//    let blueButtonTittleColor: UIColor = lab4uColor.primaryWhite
//    let whiteButtonTittleColor: UIColor = lab4uColor.secondaryGray
//    let notActiveButtonColor: UIColor = lab4uColor.secondaryGray
//    let lightGrayColor: UIColor = lab4uColor.lightGray
//    let inactiveButtonColor = lab4uColor.lightGrayButton
//    let buttonTextColor = lab4uColor.grayColorTextButton
//    let orangeButtonColor = lab4uColor.orangeButtonColor

    let boarderWidth: CGFloat = 1
    let buttonCornerRadius: CGFloat = 12
    let buttonHeight: CGFloat = 48
  }
}

// MARK: - Style

public extension Lab4uButton {
  enum Style {
    case white
    case blue
    case notActive
    case lightGray
    case orange
    case simpleWhite
    case simpleBlue
  }
}
