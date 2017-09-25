# UIButton-InspectableHitExtension
===================================

![CocoaPods](https://cocoapod-badges.herokuapp.com/v/UIButton+HitExtension/badge.png)


Extension of `UIButton` to control its touch area.

Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UIButton+SBAInspectableHitExtension'
```


Usage
-----

Create `UIButton`, then set `hitEdgeInsets`.

```objc
UIButton *button = [[UIButton alloc] init];
button.hitEdgeInsets = UIEdgeInsetsMake(100.0f, 30.0f, 100.0f, 30.0f);
```

Create `UIButton`, using interface builder and set it's `topTouch`,`leftTouch`, `bottomTouch` and `rightTouch`.

![](https://image.ibb.co/gmFhJk/Screen_Shot_2017_09_25_at_2_04_55_PM.png)

Congratulations! You're done.

License
-------

UIButton-InspectableHitExtension is under [MIT](https://opensource.org/licenses/MIT). See [LICENSE](LICENSE) file for more info.
