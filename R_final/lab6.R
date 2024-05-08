library(dplyr)

merged_data <- merge(read.csv("C:\\Users\\kirthan\\Downloads\\rfinal\\R_final\\salesF.csv"), read.csv("C:\\Users\\kirthan\\Downloads\\rfinal\\R_final\\salaryF.csv"), by = "ID")
print("merged data")
print(merged_data)

agg_data <- merged_data %>% 
            group_by(Gender) %>% 
            summarise(total_salary = sum(Salary), avg_age = mean(Age), count = n())
print(agg_data)


filt_data <- merged_data %>% 
             filter(Age > 25)
print(filt_data)


tran_data <- merged_data %>% 
             mutate(doub_sal = Salary * 2, Exp = ifelse(Age > 25, "yes", "no"))

print(tran_data)





#2nd program

merged_data1 <- merge(read.csv("C:\\Users\\kirthan\\Downloads\\rfinal\\R_final\\sales_new.csv"), read.csv("C:\\Users\\kirthan\\Downloads\\rfinal\\R_final\\customer.csv"), by.x = "Name", by.y = "Name", all = TRUE)

print(merged_data1)

merged_data1 <- merged_data1 %>% 
                mutate(total_sale = Quantity * Price)

print(merged_data1)

sales_by_count <- merged_data1 %>% 
                  group_by(Country) %>% 
                  summarise(total_profit = sum(total_sale))

print(sales_by_count)

filt_usa <- merged_data1 %>% 
            filter(Country == "USA")

print(filt_usa)