const _ohanhi$elm_native_ui$Native_ReactNativeSwipeoutView = function () {
  const React = require('react');
  var SwipeoutView = require('react-native-swipeout').default;

  const SwipeoutViewWithSingleSwipe = ({...otherProps, onRightSwipe, onLeftSwipe, right: firstRight, left: firstLeft }) =>
    <SwipeoutView
      {...otherProps}
      right={firstRight && [{...firstRight, onPress: onRightSwipe}]}
      left={firstLeft && [{...firstLeft, onPress: onLeftSwipe}]}
    />

  return {
    view: SwipeoutViewWithSingleSwipe,
  };
}();
