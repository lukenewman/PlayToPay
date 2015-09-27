// Generated by Apple Swift version 2.0 (swiftlang-700.0.59 clang-700.0.72)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import L360Confetti;
@import pop;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;

SWIFT_CLASS("_TtC9PlayToPay11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSTimer;
@class UIStoryboardSegue;
@class UIButton;
@class UILabel;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC9PlayToPay20BustItViewController")
@interface BustItViewController : UIViewController
@property (nonatomic) NSInteger timing;
@property (nonatomic) NSInteger timingFreeze;
@property (nonatomic) NSInteger count;
@property (nonatomic) NSInteger seconds;
@property (nonatomic) NSInteger canTap;
@property (nonatomic) NSInteger round;
@property (nonatomic) NSTimer * __nonnull timer;
@property (nonatomic, weak) IBOutlet UIButton * __null_unspecified mainButton;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified timeLabel;
- (void)viewDidLoad;
- (IBAction)buttonTapped:(id __nonnull)sender;
- (float)randomCGFloat;
- (void)addTime;
- (void)screenSwitch;
- (void)resetRound;
- (void)setupGame;
- (void)goToResults;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class L360ConfettiArea;
@class HTPressableButton;

SWIFT_CLASS("_TtC9PlayToPay24EndResultsViewController")
@interface EndResultsViewController : UIViewController <L360ConfettiAreaDelegate>
@property (nonatomic) L360ConfettiArea * __null_unspecified confettiArea;
@property (nonatomic) HTPressableButton * __null_unspecified playAgainButton;
@property (nonatomic) HTPressableButton * __null_unspecified venmoButton;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified loserLabel;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)showPlayAgainButton;
- (void)showVenmoButton;
- (void)drawPlayAgainButton;
- (void)drawVenmoButton;
- (void)showLoser;
- (NSArray * __null_unspecified)colorsForConfettiArea:(L360ConfettiArea * __null_unspecified)confettiArea;
- (void)backToMain;
- (void)payWithVenmo;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIView;

SWIFT_CLASS("_TtC9PlayToPay27GameSelectionViewController")
@interface GameSelectionViewController : UIViewController <POPAnimationDelegate>
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull buttonTitles;
@property (nonatomic) HTPressableButton * __null_unspecified continueButton;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified mysteryTileView;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified questionMarkLabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified gameTitleLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)drawContinueButton;
- (void)showContinueButton;
- (void)startTheSelection;
- (void)goToTheGame;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9PlayToPay18MainViewController")
@interface MainViewController : UIViewController <L360ConfettiAreaDelegate>
@property (nonatomic) NSInteger numberOfPlayers;
@property (nonatomic, readonly) NSInteger minNumberOfPlayers;
@property (nonatomic, readonly) NSInteger maxNumberOfPlayers;
@property (nonatomic) HTPressableButton * __null_unspecified commenceButton;
@property (nonatomic) HTPressableButton * __null_unspecified plusButton;
@property (nonatomic) HTPressableButton * __null_unspecified minusButton;
@property (nonatomic) L360ConfettiArea * __null_unspecified confettiArea;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified numPlayersLabel;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)drawCommenceButton;
- (void)drawPlusButton;
- (void)drawMinusButton;
- (void)commenceFestivities;
- (void)addPlayer;
- (void)subPlayer;
- (NSArray * __null_unspecified)colorsForConfettiArea:(L360ConfettiArea * __null_unspecified)confettiArea;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9PlayToPay29MinigameResultsViewController")
@interface MinigameResultsViewController : UIViewController
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull badButtonTitles;
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull goodButtonTitles;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified playerScoredALabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified betterThanLabel;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified resultLabel1;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified resultLabel2;
- (void)viewDidLoad;
- (void)drawButton:(NSString * __null_unspecified)title;
- (void)showEndResults;
- (void)showPlayerStart;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;
@class UITextView;

SWIFT_CLASS("_TtC9PlayToPay25PlayerStartViewController")
@interface PlayerStartViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, readonly, copy) NSArray<NSString *> * __nonnull buttonTitles;
@property (nonatomic) HTPressableButton * __null_unspecified playButton;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified gameTitleLabel;
@property (nonatomic, weak) IBOutlet UITextView * __null_unspecified instructionsTextView;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified enterNameView;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified enterNameLabel;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified enterNameTextField;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified scoreToBeatView;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified scoreToBeatLabel;
- (void)viewDidLoad;
- (BOOL)textFieldShouldReturn:(UITextField * __nonnull)textField;
- (void)textFieldDidEndEditing:(UITextField * __nonnull)textField;
- (void)drawPlayButton;
- (void)playGame;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9PlayToPay23RapidFireViewController")
@interface RapidFireViewController : UIViewController
@property (nonatomic) NSInteger count;
@property (nonatomic) NSInteger seconds;
@property (nonatomic) NSTimer * __nonnull timer;
@property (nonatomic) IBOutlet UILabel * __null_unspecified scoreLabel;
@property (nonatomic) IBOutlet UILabel * __null_unspecified timerLabel;
- (void)viewDidLoad;
- (void)drawButton;
- (void)setupGame;
- (void)buttonPressed;
- (void)subtractTime;
- (void)blinkTimerLabel;
- (void)goToResults;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC9PlayToPay25TapABoxGameViewController")
@interface TapABoxGameViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view11;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view12;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view13;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view21;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view22;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view23;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view31;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view32;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified view33;
@property (nonatomic) NSInteger timeLeft;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)createButtons;
- (void)createButtonInView:(UIView * __nonnull)superview;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
