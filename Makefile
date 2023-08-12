
# Runs the application in development mode
.PHONY: run-dev
run-dev:
	fvm flutter run --target \
	 lib/application/bin/envs/main_development.dart \
	 --flavor development


# Runs the application in staging mode
.PHONY: run-staging
run-dev:
	fvm flutter run --target \
	 lib/application/bin/envs/main_staging.dart \
	 --flavor staging


# Runs the application in production mode
.PHONY: run-production
run-dev:
	fvm flutter run --target \
	 lib/application/bin/envs/main_production.dart \
	 --flavor production

# Generates Freezed classes
.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs

# Runs tests and their coverage
# This will open google chrome with a coverage report that shows 
# exactly which lines have been tested, and which have yet to be tested
.PHONY: test
test:
	rm -rf coverage* && \
	fvm flutter analyze && fvm flutter test --coverage test/ && \
	lcov --remove coverage/lcov.info 'lib/**/*.g.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.freezed.dart' -o coverage/lcov.info && \
    lcov --remove coverage/lcov.info 'lib/**/*.gr.dart' -o coverage/lcov.info && \
	lcov --remove coverage/lcov.info 'lib/application/core/services/connectivity_helper.dart' -o coverage/lcov.info && \
    genhtml -q -o coverage coverage/lcov.info && \
	google-chrome coverage/index.html