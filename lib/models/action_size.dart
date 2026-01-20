enum SizeState {
  small(24),
  medium(32),
  large(40),
  xlarge(48),
  xxlarge(56),
  xxxlarge(64),
  xxxxlarge(72),
  xxxxxlarge(80),
  xxxxxxlarge(88),
  xxxxxxxlarge(96),
  xxxxxxxxxxxlarge(104),
  xxxxxxxxxxxxlarge(112),
  xxxxxxxxxxxxxlarge(120),
  xxxxxxxxxxxxxxlarge(128),
  xxxxxxxxxxxxxxxlarge(136),
  xxxxxxxxxxxxxxxxlarge(144),
  xxxxxxxxxxxxxxxxxlarge(152),
  xxxxxxxxxxxxxxxxxxlarge(160),
  xxxxxxxxxxxxxxxxxxxlarge(168),
  xxxxxxxxxxxxxxxxxxxxlarge(176);

  final double value;
  const SizeState(this.value);
}
