. .\pac.ps1
$version = "0.4.5"
$tag = "$version"

git add .
git commit -m "Create new release $tag"
git push
git tag $tag
git push origin tag $tag