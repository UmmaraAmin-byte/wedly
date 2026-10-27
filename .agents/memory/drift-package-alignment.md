---
name: Drift package alignment
description: Compatibility checks for Drift and native SQLite in Flutter projects.
---

Keep `drift`, `drift_flutter`, and `drift_dev` aligned with the project's Dart SDK and with each other. Verify that the native SQLite library is available for native database tests.

**Why:** Dependency resolution can succeed despite a package API mismatch, and native tests may fail when the operating-system SQLite library is missing.

**How to apply:** When changing any Drift package, inspect the resolved package set and SDK constraints together, then run static analysis and native database tests.
