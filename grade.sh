# Create your grading script here

CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
file="TestListExamples.java"
totalPoints=2

rm -rf student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission/
cd student-submission

if [[ -f $file ]] && [[ -e $file ]]
then
    echo "File exists!"
else
    echo "File not found!"
    exit 1
fi

javac -cp $CPATH *.java

if [[ $? -eq 0 ]]
then
    echo "Compile succeeded"
else
    echo "Your program didn't compile"
    exit 2
fi

java -cp $CPATH  org.junit.runner.JUnitCore TestListExamples 2> errors.txt

if [[grep -c "testFilter(TestListExamples)" errors.txt | -eq 1]]
then
     ((totalPoints-=1))
    let "totalPoints-=1"
    echo "[FAILED 0/1] testFilter"
fi

if [[grep -c "testMerge(TestListExamples)" errors.txt | -eq 1]]
then
    ((totalPoints-=1))
    let "totalPoints-=1"
    echo "[FAILED 0/1] testMerge"
fi

echo Total Grade: $totalPoints/2


