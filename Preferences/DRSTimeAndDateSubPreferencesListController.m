#import "DRSTimeAndDateSubPreferencesListController.h"

@implementation DRSTimeAndDateSubPreferencesListController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.appearanceSettings = [DRSAppearanceSettings new];
    self.hb_appearanceSettings = [self appearanceSettings];

    self.blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    self.blurView = [[UIVisualEffectView alloc] initWithEffect:[self blur]];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    [[self blurView] setFrame:[[self view] bounds]];
    [[self blurView] setAlpha:1];
    [[self view] addSubview:[self blurView]];

    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[self blurView] setAlpha:0];
    } completion:nil];

}

- (id)specifiers {

    return _specifiers;

}

- (void)loadFromSpecifier:(PSSpecifier *)specifier {

    NSString* sub = [specifier propertyForKey:@"DRSSub"];
    NSString* title = [specifier name];

    _specifiers = [self loadSpecifiersFromPlistName:sub target:self];

    [self setTitle:title];
    [[self navigationItem] setTitle:title];

}

- (void)setSpecifier:(PSSpecifier *)specifier {

    [self loadFromSpecifier:specifier];
    [super setSpecifier:specifier];

}

- (BOOL)shouldReloadSpecifiersOnResume {

    return false;

}

- (void)showTimeFontPicker {
    
    self.timeFontPicker = [UIFontPickerViewController new];
    [[self timeFontPicker] setDelegate:self];
    [self presentViewController:[self timeFontPicker] animated:YES completion:nil];
    
}

- (void)showDateFontPicker {
    
    self.dateFontPicker = [UIFontPickerViewController new];
    [[self dateFontPicker] setDelegate:self];
    [self presentViewController:[self dateFontPicker] animated:YES completion:nil];
    
}

- (void)fontPickerViewControllerDidPickFont:(UIFontPickerViewController *)viewController {
    
    UIFontDescriptor* descriptor = [viewController selectedFontDescriptor];
    UIFont* font = [UIFont fontWithDescriptor:descriptor size:17];

    if ([viewController isEqual:[self timeFontPicker]])
        [[self preferences] setObject:[font familyName] forKey:@"customChosenTimeFont"];
    else if ([viewController isEqual:[self dateFontPicker]])
        [[self preferences] setObject:[font familyName] forKey:@"customChosenDateFont"];
    
}

@end