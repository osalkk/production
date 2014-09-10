class stages {
  stage { 'pre':
    before => Stage['main'],
  }
}

