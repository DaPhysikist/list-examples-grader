# Create your grading script here

CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"
file="student-submission/ListExamples.java"
totalPoints=2

rm -rf student-submission
git clone $1 student-submission
cp TestListExamples.java student-submission/

if [[ -f $file ]] && [[ -e $file ]]
then
    echo "File exists!"
else
    echo "File not found!"
    echo "Total Points: 0/2"
    exit 1
fi

cd student-submission

javac -cp $CPATH ListExamples.java 2>> errors.txt 

javac -target 1.8  -cp $CPATH -Xdiags:verbose TestListExamples.java 2>> errors.txt  

java -cp $CPATH  org.junit.runner.JUnitCore TestListExamples > failures.txt

if [[ $(grep -c "error: method filter" errors.txt) -ne 0 ]]
then
    let "totalPoints-=1"
    echo "[EXCEPT 0/1] testFilter"
elif [[ $(grep -c "testFilter(TestListExamples)" failures.txt) -ne 0 ]]
then
    let "totalPoints-=1"
    echo "[FAILED 0/1] testFilter"
else
    echo "[PASSED 1/1] testFilter"
fi

if [[ $(grep -c "error: method merge" errors.txt) -ne 0 ]]
then
    let "totalPoints-=1"
    echo "[EXCEPT 0/1] testMerge"
elif [[ $(grep -c "testMerge(TestListExamples)" failures.txt) -ne 0 ]]
then
    let "totalPoints-=1"
    echo "[FAILED 0/1] testMerge"
else
    echo "[PASSED 1/1] testMerge"
fi

echo "Total Points: $totalPoints/2"