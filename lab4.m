Iris = load('iris.data');
Iris = Iris(randperm(size(Iris,1)),:);

correct = 0;

for i =1 : size(Iris,1)
    if nn_classifier(Iris(:,1:4),Iris(:,5),Iris(i,1:4)) == Iris(i,5)
        correct = correct+1;
    end
end

fprintf('accuracy of nn over training set is %f%% \n',correct/size(Iris,1)*100);
correct = 0;
trainingset = Iris(1:100, :);
testset = Iris(101:150,:);

for i = 1 : size(testset,1)
    if nn_classifier(trainingset(:,1:4),trainingset(:,5),testset(i,1:4)) == testset(i,5)
        correct = correct+1;
    end
end

fprintf('accuracy of nn over hold out method is %f%% \n',correct/size(testset,1)*100);

%knn question 3 in lab 4
k=[1 5 10];
for h = 1 : size(k,2)
    correct_knn=0;
    for i = 1 : size(testset,1)
        if(knn_classifier(trainingset(:,1:4),trainingset(:,5),testset(i,1:4),k(h)) == testset(i,5))
            correct_knn = correct_knn+1;
        end
    end
    fprintf('accuracy of knn(k = %d) over hold out method is %f%% \n',k(h),correct_knn/size(testset,1)*100);
end

% 10 fold cross validation. knn

for h = 1 : size(k,2)
    avg=0;
    for v=1:10     
        correct_knn=0;
        Iris = Iris(randperm(size(Iris,1)),:);
        trainingset = Iris(1:135, :);
        testset = Iris(136:150,:);
        for i = 1 : size(testset,1)
            if(knn_classifier(trainingset(:,1:4),trainingset(:,5),testset(i,1:4),k(h)) == testset(i,5))
                correct_knn = correct_knn+1;
            end
        end
        avg = avg+(correct_knn/size(testset,1))*100;        
    end
    fprintf('Average accuracy of knn(k = %d) using 10-fold cross validation method is %f%% \n',k(h),avg/10);
end