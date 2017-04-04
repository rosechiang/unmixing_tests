close all
clear
mat = lsmfileread('sox10BAC_AviRangap_18s3_subset_Subset.lsm');
mat2= squeeze(mat);
 % test = mean(mat2,3);
    % imagesc(test)
    
    % for i = 1:32
    %     figure(i)
    %     imagesc(mat2(:,:,i));
    % end
    %
    % one = mat2(:,:,6);
    % two = mat2(:,:,10);
    % three = mat2(:,:,18);
    % colorimg = zeros(947,1050,3);
    %
    %
    % colorimg(:,:,1) = one;
    % colorimg(:,:,2) = two;
    % colorimg(:,:,3) = three;
    % figure(2)
    % imagesc(colorimg)
    
    % autoflourence
    g1 = [];
    g2 = [];
    for xg = 59:70
        for yg = 641:648
            g1 = [g1 ; squeeze(mat2(xg,yg,:))'];
        end
    end
    
    for xg = 363:379
        for yg = 959:965
            g2 = [g2 ; squeeze(mat2(xg,yg,:))'];
        end
    end
    figure(1); plot (mean(g1)); hold on; plot(mean(g2)); title('autofluorescence spectrum (target cell)')
    % %
    % % Position X: 641, 648, Y: 59, 70
    % % Position X: 959, 965, Y: 363, 379
    % Position X: 956, 968, Y: 369, 380
    % neuron creast
    r1 = [];
    r2 = [];
    for xr = 38:45
        for yr = 503:508
            r1 = [r1 ; squeeze(mat2(xr,yr,:))'];
        end
    end
    for xr = 57:68
        for yr = 528:535
            r2 = [r2 ; squeeze(mat2(xr,yr,:))'];
        end
    end
    figure(2); plot (mean(r1)); hold on; plot(mean(r2)); title('Mcherry spectrum (neuron crest)')
    
    % r1=squeeze(mat2(66,481,:));
    % r2=squeeze(mat2(71,406,:));
    % % r3=squeeze(mat2(170,723,:));
    % r4=squeeze(mat2(245,871,:));
    % %
    % % Position X: 503, 508, Y: 38, 45
    % % Position X: 528, 535, Y: 57, 68
    
    
    %cell membrane
    b1 = [];
    b2 = [];
    for xb = 127:177
        for yb = 773:785
            b1 = [b1 ; squeeze(mat2(xb,yb,:))'];
        end
    end
    for xb = 10:18
        for yb = 527:533
            b2 = [b2 ; squeeze(mat2(xb,yb,:))'];
        end
    end
    figure(3); plot (mean(b1));hold on; plot(mean(b2)); title('CFP-H2B spectrum (nucleus)')
    %
    % b1=squeeze(mat2(728,1004,:));
    % b2=squeeze(mat2(774,142,:));
    % b3=squeeze(mat2(25,551,:));
    % b4=squeeze(mat2(66,457,:));
    % %
    % % Position X: 773, 785, Y: 129, 177
    % % Position X: 527, 533, Y: 10, 19
    
    %
    % figure(1); hold on
    % plot(g1)
    % plot(g2)
    % plot(g3)
    % plot(g4)
    % title('')
    
    figure(4); hold on
    G = mean(g2);
    R = (mean(r1)+mean(r2))/2;
    B = mean(b1);
    R(1:15) = 0;
    % G = G -B;
    plot(G)
    plot(R)
    plot(B)
    title('Indivual Spectrum for unmixing')
    
     
    nindvars = 3;
    startfit = 1;
    endfit = 32;
    indvars = [G;R;B];
    
    
    [coef, timewonoise] = cubedatafit(nindvars, startfit, endfit, indvars, mat2);
    
    unmix1 = sum(mat2,3).*coef(:,:,1);
    unmix2 = sum(mat2,3).*coef(:,:,2);
    unmix3 = sum(mat2,3).*coef(:,:,3);
    
    cmap = jet(floor(max(max(unmix1))));
    cmap(1,:) = [0,0,0];
    figure(5);imagesc(unmix1);title('Autofluorescence');colormap(cmap)
    figure(6);imagesc(unmix2);title('Neural crest');colormap(cmap)
    figure(7);imagesc(unmix3);title('Nucleus');colormap(cmap)