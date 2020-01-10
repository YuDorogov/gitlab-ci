Build Docker image:
  stage: build
# Using debug image for gitlab-ci purpose https://docs.gitlab.com/ee/ci/docker/using_kaniko.html
  image:
    name: gcr.io/kaniko-project/executor:debug-v0.10.0
    entrypoint: [""]
  script:
    - export GOOGLE_APPLICATION_CREDENTIALS="$(pwd)/my_gcr_creds.json"
    - echo "{\"auths\":{\"$CI_REGISTRY\":{\"username\":\"$CI_REGISTRY_USER\",\"password\":\"$CI_REGISTRY_PASSWORD\"}}}" > /kaniko/.docker/config.json 
    - /kaniko/executor --context $(pwd) --dockerfile ./Dockerfile --destination $GCR_REPO --destination $GITLAB_DOCKER_REPO
