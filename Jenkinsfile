pipeline {
	 agent any
	 stages {
		stage("build") {
			 steps {
				 bat 'gradle clean buil'
			 }
		}
		 stage("test") {
			 steps {
				 bat 'gradle clean executeFeature -D environmentName="QA" -DcucumberTags="@regression"'
			 }
		 }
		 stage("deploy") {
			 steps {
				 bat 'echo deploying'
			 }
		 }
	 }
 }
 
