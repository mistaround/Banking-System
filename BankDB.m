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
            %δ���ǲ���ͬ��������̫С
        end
        %����mac��xls��ʽ��֧��Matlab��д�����Ա���ʹ��csv��ʽ
        function write_end(DB,data)
            %��data���һ����ӣ����ڿ���
            fprintf(DB.accountdata,'%s,',data{1});
            fprintf(DB.accountdata,'%s,',data{2});
            fprintf(DB.accountdata,'%s,',data{3});
            fprintf(DB.accountdata,'%f\n',data{4});
            DB.accountdata = fopen('AccountData.csv','a+');
        end
        
        function rewrite(DB,data)
            %����ʹ��csv��ʽ��ÿ�θ�����Ϣ����Ҫ��д�����ļ����ú������ڴ�ͷ��дdata
            [r,~] = size(data);
            DB.accountdata = fopen('AccountData.csv','w+');
            for i = 1:r
                fprintf(DB.accountdata,'%s,',data.Name(i));
                fprintf(DB.accountdata,'%s,',data.Account(i));
                fprintf(DB.accountdata,'%s,',data.Password(i));
                fprintf(DB.accountdata,'%f\n',data.Balance(i));
            end
        end
        %�⼸��������csvʵ������̫�鷳��,���һή��Ч�ʣ�׼��֮���iteration�о��£�
        %�ñ�Ĵ��淽ʽʵ��,�����ݲ�ʵ�ֽ��׼�¼���� 5/13
        %function write_to_data(DB,type)
        %end
        
        %function write_to_screen(DB,data)     
        %end
        
        %function rewritedata(DB,data)            
        %end
    end
end