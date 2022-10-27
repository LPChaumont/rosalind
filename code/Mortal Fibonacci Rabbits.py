n = 95 #replace input                                                                        
m = 17                                                                        
bunnies = [1, 1]                                                               
months = 2
count = []                                                                     
while months < n:                                                              
    if months < m:                                                             
        bunnies.append(bunnies[-2] + bunnies[-1])                              
    elif months == m or count == m + 1:                                        
        bunnies.append(bunnies[-2] + bunnies[-1] - 1)                          
    else:                                                                      
        bunnies.append(bunnies[-2] + bunnies[-1] - bunnies[-(                  
            m + 1)])                                                           
    months += 1                                                               
print(bunnies[-1])
