#!/bin/sh
set -eu
echo "VM5 attack preflight: poisoning lower-confidence Buildkite markers"

fake="$RUNNER_TEMP/vm5-fake-buildkite"
mkdir -p "$fake"
cat > "$fake/buildkite-agent" <<'SH'
#!/bin/sh
exit 0
SH
chmod +x "$fake/buildkite-agent"
echo "$fake" >> "$GITHUB_PATH"

{
  echo 'BUILDKITE=true'
  echo 'BUILDKITE_PULL_REQUEST=4242'
  echo 'BUILDKITE_PULL_REQUEST_BASE_BRANCH=HEAD'
  echo 'BUILDKITE_COMMIT=HEAD'
  echo 'BUILDKITE_BRANCH='
} >> "$GITHUB_ENV"
