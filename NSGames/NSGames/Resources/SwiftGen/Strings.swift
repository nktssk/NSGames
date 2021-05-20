// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Авторизация
  internal static let auth = L10n.tr("Localizable", "Auth")
  /// Покупка
  internal static let buy = L10n.tr("Localizable", "Buy")
  /// Выбрать
  internal static let choose = L10n.tr("Localizable", "Choose")
  /// Код из письма
  internal static let code = L10n.tr("Localizable", "Code")
  /// ✍️ Комментарий:
  internal static let comment = L10n.tr("Localizable", "Comment")
  /// Комментарий к предложению.
  internal static let commentToOffer = L10n.tr("Localizable", "CommentToOffer")
  /// Создайте его
  internal static let createAccount = L10n.tr("Localizable", "CreateAccount")
  /// Создание аккаунта
  internal static let creatingAccount = L10n.tr("Localizable", "CreatingAccount")
  /// Описание
  internal static let description = L10n.tr("Localizable", "Description")
  /// Email
  internal static let email = L10n.tr("Localizable", "Email")
  /// Введите email
  internal static let enterEmail = L10n.tr("Localizable", "EnterEmail")
  /// Забыли пароль?
  internal static let forgotPassword = L10n.tr("Localizable", "ForgotPassword")
  /// Уже есть аккаунт?
  internal static let haveAccount = L10n.tr("Localizable", "HaveAccount")
  /// У вас нет аккаунта?
  internal static let haveNoAccount = L10n.tr("Localizable", "HaveNoAccount")
  /// Логин
  internal static let login = L10n.tr("Localizable", "Login")
  /// Войдите
  internal static let logIn = L10n.tr("Localizable", "LogIn")
  /// Название:
  internal static let name = L10n.tr("Localizable", "Name")
  /// Новый пароль
  internal static let newPassword = L10n.tr("Localizable", "NewPassword")
  /// Далее
  internal static let next = L10n.tr("Localizable", "Next")
  /// Нет аккаунта?
  internal static let noAccount = L10n.tr("Localizable", "NoAccount")
  /// Нет объявлений для показа
  internal static let noAds = L10n.tr("Localizable", "NoAds")
  /// Нет предложений для обмена
  internal static let noOffers = L10n.tr("Localizable", "NoOffers")
  /// Количество предложений 🗂
  internal static let numberOfOffers = L10n.tr("Localizable", "NumberOfOffers")
  /// Количество просмотров 👀
  internal static let numberOfViews = L10n.tr("Localizable", "NumberOfViews")
  /// 🪙 Предложенная цена:
  internal static let offerPrice = L10n.tr("Localizable", "OfferPrice")
  /// Пароль
  internal static let password = L10n.tr("Localizable", "Password")
  /// Пароль еще раз
  internal static let passwordAgain = L10n.tr("Localizable", "PasswordAgain")
  /// Пароли не совпадают
  internal static let passwordDif = L10n.tr("Localizable", "PasswordDif")
  /// Введите желаемую цену.
  internal static let preferPrice = L10n.tr("Localizable", "PreferPrice")
  /// Цена
  internal static let price = L10n.tr("Localizable", "Price")
  /// Войти
  internal static let signIn = L10n.tr("Localizable", "SignIn")
  /// Создание аккаунта
  internal static let signUp = L10n.tr("Localizable", "SignUp")
  /// Состояние
  internal static let state = L10n.tr("Localizable", "State")
  /// Предложить
  internal static let submit = L10n.tr("Localizable", "Submit")
  /// Обмен
  internal static let trade = L10n.tr("Localizable", "Trade")
  /// Игры для обмена
  internal static let tradeGames = L10n.tr("Localizable", "TradeGames")
  /// 🤝 Обмен на: 
  internal static let tradeTo = L10n.tr("Localizable", "TradeTo")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
