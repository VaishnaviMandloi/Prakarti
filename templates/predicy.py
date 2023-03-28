import numpy as np
import pickle
# from sklearn.preprocessing import StandardScaler

loaded_model = pickle.load(open('D:/vaishnavi/Minor Project/Prakarti/templates/diabetes_training_model.sav', 'rb') )# taking example 4,110,92,0,0,37.6,0.191,30,0  a non diabetic person
# for diabetic 6,148,72,35,0,33.6,0.627,50,1
input_data = (1,89,66,23,94,28.1,0.167,21)

# chaning input_data to numpy array
input_data_as_numpy_array = np.array(input_data)

# reshaping array as we are predicting only one value
input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)
print(loaded_model)

# standardize the input data
# scaler = StandardScaler()
# std_data = scaler.transform(input_data_reshaped)
# print(std_data)

prediction = loaded_model.predict(input_data_reshaped)
print(prediction)
if(prediction[0] ==0):
    print('non-diabetic person')
else:
    print('diabetic person')