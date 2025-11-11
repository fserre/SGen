### v.25.11.11
#### Bugfixes
- Fix an issue with FixedPoint representation conversion that would generate incorrect designs,
- Fix an issue where FixedPoint arithmetic operations would not be simplified,
- Tests on outputs in test benches are now precisely checked.

#### New features
- Add support for inverse DFT/WHT,
- Add support for scaling factors,
- Outputs of test benches are now displayed in a more user-friendly way.
- Sgen is now realised as a fat jar file for easier distribution.

#### Other changes
- Use Scala 3.7,3, sbt 1.11.6,
- Use a CI pipeline for automatic testing and deployment.