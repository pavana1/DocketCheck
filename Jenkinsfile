pipeline {
agent none
stages {
stage('Checkout Code') {
steps {
checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pavana1/DocketCheck']]])
}
}
stage('Execute Tests') {
steps{
sh 'robot test.robot'
}
}
stage('Results') {
steps {
script{
bat 'del "Results\\*.zip'
zip zipFile: 'results/results.zip', archive: false, dir: 'results', glob: '*.html'
step(
[
$class : 'test',
outputPath : 'results',
outputFileName : "output.xml",
reportFileName : 'report.html',
logFileName : 'log.html',
disableArchiveOutput: false,
passThreshold : 95.0,
unstableThreshold : 90.0,
otherFiles : "**/*.png,**/*.jpg",
]
)
}
}
}
}
post {
always {
node('node_label') {
archive (includes: 'results/*.html')
}
}
}
}