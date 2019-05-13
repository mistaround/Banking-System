classdef BankDB < handle
    properties
        queue
        accountdata
        %tradingdata
        addr
        %addrt
    end
    methods
        function inqueue(DB,ticketNO)
            DB.queue = [DB.queue,ticketNO];
        end
        
        function outqueue(DB)
            DB.queue(1) = [];
        end
        
        function new = generate_account(DB)
            new = round(899999*rand)+100000;
            %未考虑不相同数，几率太小
        end
        %由于mac的xls格式不支持Matlab读写，所以被迫使用csv格式
        function write_end(DB,data)
            %在data最后一行添加，用于开户
            fprintf(DB.accountdata,'%s,',data{1});
            fprintf(DB.accountdata,'%s,',data{2});
            fprintf(DB.accountdata,'%s,',data{3});
            fprintf(DB.accountdata,'%f\n',data{4});
            DB.accountdata = fopen('AccountData.csv','a+');
        end
        
        function rewrite(DB,data)
            %由于使用csv格式，每次更新信息都需要重写整个文件，该函数用于从头重写data
            [r,~] = size(data);
            DB.accountdata = fopen('AccountData.csv','w+');
            for i = 1:r
                fprintf(DB.accountdata,'%s,',data.Name(i));
                fprintf(DB.accountdata,'%s,',data.Account(i));
                fprintf(DB.accountdata,'%s,',data.Password(i));
                fprintf(DB.accountdata,'%f\n',data.Balance(i));
            end
        end
        %这几个功能用csv实现起来太麻烦了,而且会降低效率，准备之后的iteration研究下，
        %用别的储存方式实现,所以暂不实现交易记录功能 5/13
        %function write_to_data(DB,type)
        %end
        
        %function write_to_screen(DB,data)     
        %end
        
        %function rewritedata(DB,data)            
        %end
    end
end