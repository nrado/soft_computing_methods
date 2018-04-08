function primerGA

% primena GA za ordredjivanje trougla maksimalne povrsine za zadatu eilipsu
% (x/a)^2 + (y/b)^2 = 1

close all; clear all
% definisanje parametara GA
% duzina hromozoma L
N = 100; L = 36; pc = 0.85; pm = 0.002; G = 0.8;
% definisanje parametara elipse
a = 10; b = 3; a2 = a * a; b2 = b * b;

uslov = 0;  % uslov za zavrsetak GA
brgen = 1;  % broj generacija

while uslov == 0
    if brgen == 1
        for i = 1:N
            tmp = rand;
            gennov(i, 1:L) = dec2bin(round(tmp * (2^L-1)), L)
        end
    end
    
    % evaluacija generacije
    for i = 1:N
        % Tacke 1,2,3 - broj izmedju [0-2pi]
        T1(i) = bin2dec(gennov(i, 1 : L/3)) / (2^(L/3)-1) * 2 *pi;
        T2(i) = bin2dec(gennov(i, L/3+1 : 2*L/3)) / (2^(L/3)-1) * 2 *pi;
        T3(i) = bin2dec(gennov(i, 2*L/3 : L)) / (2^(L/3)-1) * 2 *pi;
        
        if T1(i) < pi/2 | T1(i) > 3*pi/2
            x = sqrt(1/(1/a2 + tan(T1(i))^2));
        else
            x = -sqrt(1/(1/a2 + tan(T1(i))^2 / b2));
        end
        x1(i) = x; y1(i) = x1(i) * tan(T1(i));
        
        if T2(i) < pi/2 | T2(i) > 3*pi/2
            x = sqrt(1/(1/a2 + tan(T2(i))^2));
        else
            x = -sqrt(1/(1/a2 + tan(T2(i))^2 / b2));
        end
        x2(i) = x; y2(i) = x2(i) * tan(T2(i));

        if T3(i) < pi/2 | T3(i) > 3*pi/2
            x = sqrt(1/(1/a2 + tan(T3(i))^2));
        else
            x = -sqrt(1/(1/a2 + tan(T3(i))^2 / b2));
        end
        x3(i) = x; y3(i) = x3(i) * tan(T3(i));
        
        aa = sqrt((x2(i) - x1(i))^2 + (y2(i) - y1(i))^2);
        bb = sqrt((x3(i) - x1(i))^2 + (y3(i) - y1(i))^2);
        cc = sqrt((x2(i) - x3(i))^2 + (y2(i) - y3(i))^2);
        
        % poluobim
        ss = (aa + bb + cc) / 2;

        f(i) = sqrt(ss * (ss-aa) * (ss-bb) * (ss-cc));
        
        % f(i) kriterijumska funkcija je Heronov obrazac
    end

    % prikaz elipse i trougla
    elipsa = [];
    for i = 1:200
        teta = (1-i) * 2 * pi / 199;
        xx = 1/ (1/a2 + tan(teta)^2 / b2);
        xx = sqrt(xx);
        yy = xx * tan(teta);

        if teta < pi
            yy = abs(yy);
        else
            xx = yy / tan(teta);
        end
        elipsa = [ elipsa ; xx yy ];
    end
    
    figure(1); plot(elipsa(:,1), elipsa(:,2)); hold on;
        
    for i = 1:N
        if f(i) == max(f)
            plot([x1(i) x2(i) x3(i) x1(i) ], [ y1(i) y2(i) y3(i) y1(i) ], 'LineWidth', 4, 'color', [0.6 0 0]);
            hold on;
        else
            plot([x1(i) x2(i) x3(i) x1(i) ], [ y1(i) y2(i) y3(i) y1(i) ], 'LineWidth', 4, 'color', 'b');
            hold on;
        end
    end
    title (['Generacija broj ', num2str(brgen), 'najbolji rezultat je ', num2str(max(f))]);
    
    fmax(brgen) = max(f)
    uslov = 1;
end

end

            