#!/usr/bin/env bash
scala_versions=(
  2.12.6
)
sbt_versions=(
  1.2.1
)
for scala_version in ${scala_versions[@]}; do
  for sbt_version in ${sbt_versions[@]}; do
    version=scala-${scala_version}-sbt-${sbt_version}
    docker build -t rugdsdev/circleci-base-image:${version} --build-arg SCALA_VERSION=${scala_version} --build-arg SBT_VERSION=${sbt_version} .
    docker push rugdsdev/circleci-base-image:${version}
    echo "Built ${version}"
  done
done