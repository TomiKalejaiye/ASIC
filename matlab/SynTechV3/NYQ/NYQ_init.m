% =========================================================================
% ECE 5746 - Simple Sawtooth Wave Oscillator Model
% (c) 2019 ok93@cornell.edu, ut33@cornell.edu, ll556@cornell.edu
% ===================================================================
function [par,sta] = NYQ_init(par,sta)


    FixP_out = {0,23,'s'}; % {I,F,'s'} where 's' is signed 
    QType_out = 'WrpTrc_NoWarn'; % we wrap and truncate 
    
    
    % =========================================================================
    % ==============         FILTER COEFFICIENTS          ===================== 
    % ============== here we have different sized arrays  =====================
    % ============== for the filter coefficients,in order =====================
    % ============== to use, comment out all but one lst  =====================
    % =========================================================================
    
    % length 16 coeff array:
    % x_D = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1]; 
    
    % length 24 coeff array:
    % x_D = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5,0.6,0.7,0.8,0.9,0.9,0.8,0.7,0.6,0.5,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; 
    
    % length 32 coeff array:
     x_D = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55, 0.6,0.65, 0.7,0.75, 0.8,0.9,0.9,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.45,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; 
    
    % length 512 coeff array:
    %x_D = [0.000974760608716798,-0.000814566382769116,-0.000587439101948538,-0.000446803341385845,-0.000352698343712235,-0.000279332910949315,-0.000212003117801307,-0.00014297151143561,-7.07551353057681e-05,2.79282614021521e-06,7.25526085169485e-05,0.000132809373413279,0.000177065802713278,0.000200547279514387,0.000199663295614572,0.000174122279439677,0.000125655124180849,5.96091116875056e-05,-1.72321075387497e-05,-9.55598614554318e-05,-0.000166461462758403,-0.000220428423734313,-0.000250779114080171,-0.000252008085655159,-0.0002234669876132,-0.000166185286874397,-8.7039455873236e-05,6.92795781244925e-06,0.00010372072882993,0.000192136240015363,0.000262914790039323,0.000302792134668104,0.000310044804600489,0.00028010756806309,0.000214560460906412,0.000120409041238688,8.75251444563616e-06,-0.000109003398165533,-0.00021904244622581,-0.000307559078745625,-0.000362324346232173,-0.000375793059698525,-0.000344916076100867,-0.00027184139818119,-0.000163215644949003,-3.04980966966361e-05,0.000111396113692465,0.000245526279748463,0.000355377628079852,0.000426818021236783,0.000449939117018485,0.000420288336147457,0.000339319686279749,0.000214866390354998,5.97803131827438e-05,-0.000108171429910173,-0.000269962661070207,-0.000405283090212736,-0.000497392390926907,-0.000533546992961923,-0.000506816836567719,-0.000419046711998775,-0.000277689594458926,-9.80224997776918e-05,9.96925566011924e-05,0.000292553425095262,0.000457687300648684,0.000573910995509865,0.000625715842075052,0.000604737676681199,0.000511029335745399,0.000352892317466653,0.000147088579956311,-8.34137671209931e-05,-0.000311810336801547,-0.000510991700603516,-0.000656133594468835,-0.000728049123995096,-0.000715467386676795,-0.00061716451028695,-0.00044197643257179,-0.00020827459951958,5.8123066197223e-05,0.000326618800056991,0.000565076157204841,0.000744245382470917,0.000840416605035771,0.000839803678684438,0.000739088050054782,0.000546994276474945,0.000283619227410963,-2.23333158560568e-05,-0.000335564484666028,-0.000618936073285791,-0.000837779507490927,-0.000963940491934587,-0.000979254202799912,-0.000878556622664113,-0.000670098724295107,-0.000375193553360331,-2.61528950384784e-05,0.000337009608367217,0.000671591932171266,0.000936820454864123,0.00109892191499811,0.00113521687389173,0.00103756803624229,0.000813408097499605,0.000485561185272115,8.96545119896399e-05,-0.000329182452588241,-0.00072185926503934,-0.0010407725913145,-0.00124575052583585,-0.00130896250826477,-0.00121829539527311,-0.000980000669791717,-0.000617699814397936,-0.000170858511568497,0.000309925098659387,0.000768636938308674,0.00114993003097963,0.00140608578670938,0.00150285423716837,0.00142381245758112,0.00117301099925146,0.000775160647471376,0.000273023483697537,-0.000276891614679399,-0.000810594008541549,-0.00126409185458638,-0.00158109574001928,-0.00171970574928787,-0.00165803579080664,-0.00139736609628869,-0.000962701241549757,-0.000400335519520576,0.000226711921565953,0.000845904987216462,0.00138325754054803,0.00177254099022061,0.00196288780089767,0.00192567735872109,0.00165836299799573,0.00118569521681716,0.000557717621125594,-0.000155858570784707,-0.000872747008487381,-0.0015078638084413,-0.00198320672060528,-0.00223730600369586,-0.00223320360048813,-0.00196346329235916,-0.00145185835636715,-0.000751708980509443,5.95954502500677e-05,0.0008891317626284,0.00163888196311656,0.00221722431780696,0.00255008337287879,0.00259015676865732,0.002323368039096,0.0017717278888134,0.000991786529164081,6.89299542049788e-05,-0.000891758285101105,-0.00177728036180273,-0.00248001023912596,-0.00291045092902029,-0.00300866227105189,-0.00275197493139868,-0.00215934230017001,-0.00129004516714532,-0.000238239542944324,0.000877152022915285,0.00192575184075253,0.00278053020663817,0.00333334396365827,0.0035081792338471,0.00327121967486489,0.0026363787488134,0.0016652602523239,0.000461488433022925,-0.000840006213374262,-0.00208797174144045,-0.00313212305593881,-0.00384088276243531,-0.00411768653907351,-0.00391375698511477,-0.00323547857935467,-0.00214572234332814,-0.000758524896619108,0.000772491603384343,0.0022707953745532,0.00355679752318118,0.00446913765786191,0.00488439109534615,0.00473307060651153,0.00401008668759223,0.0027777843988899,0.00116162910083432,-0.000662385564169472,-0.00248601626699243,-0.00409218692675419,-0.00528009491353961,-0.00588952206423463,-0.00582164522974047,-0.00505322950000201,-0.00364287888444722,-0.00172798261693058,0.000487854762669755,0.00275559610038603,0.00480769217038575,0.00638860123098345,0.00728533512193043,0.00735455220303825,0.00654296636132875,0.00489832574061208,0.00256921950393285,-0.000206573171002234,-0.00312478694630254,-0.00584628447909959,-0.00803438590776681,-0.00939391219783367,-0.00970808641776502,-0.00886829162782091,-0.00689372758814031,-0.0039376604345941,-0.000278947090658052,0.00370084789886309,0.00755362016085327,0.0108101553802655,0.0130316933213043,0.0138612460294539,0.0130699778791435,0.0105932257364177,0.00655170455920665,0.00125512919019244,-0.00481334546568518,-0.0110313723430982,-0.016687694104015,-0.0210444414032303,-0.0234060455574894,-0.0231880873828892,-0.0199795288100584,-0.0135922430235074,-0.00409245716064533,0.00818959327436995,0.0226733019370683,0.0385642878230295,0.0549111723918984,0.0706778795034083,0.0848253633229793,0.0963957170111114,0.104590517111302,0.108837319636229,0.108837319636229,0.104590517111302,0.0963957170111114,0.0848253633229793,0.0706778795034083,0.0549111723918984,0.0385642878230295,0.0226733019370683,0.00818959327436995,-0.00409245716064533,-0.0135922430235074,-0.0199795288100584,-0.0231880873828892,-0.0234060455574894,-0.0210444414032303,-0.016687694104015,-0.0110313723430982,-0.00481334546568518,0.00125512919019244,0.00655170455920665,0.0105932257364177,0.0130699778791435,0.0138612460294539,0.0130316933213043,0.0108101553802655,0.00755362016085327,0.00370084789886309,-0.000278947090658052,-0.0039376604345941,-0.00689372758814031,-0.00886829162782091,-0.00970808641776502,-0.00939391219783367,-0.00803438590776681,-0.00584628447909959,-0.00312478694630254,-0.000206573171002234,0.00256921950393285,0.00489832574061208,0.00654296636132875,0.00735455220303825,0.00728533512193043,0.00638860123098345,0.00480769217038575,0.00275559610038603,0.000487854762669755,-0.00172798261693058,-0.00364287888444722,-0.00505322950000201,-0.00582164522974047,-0.00588952206423463,-0.00528009491353961,-0.00409218692675419,-0.00248601626699243,-0.000662385564169472,0.00116162910083432,0.0027777843988899,0.00401008668759223,0.00473307060651153,0.00488439109534615,0.00446913765786191,0.00355679752318118,0.0022707953745532,0.000772491603384343,-0.000758524896619108,-0.00214572234332814,-0.00323547857935467,-0.00391375698511477,-0.00411768653907351,-0.00384088276243531,-0.00313212305593881,-0.00208797174144045,-0.000840006213374262,0.000461488433022925,0.0016652602523239,0.0026363787488134,0.00327121967486489,0.0035081792338471,0.00333334396365827,0.00278053020663817,0.00192575184075253,0.000877152022915285,-0.000238239542944324,-0.00129004516714532,-0.00215934230017001,-0.00275197493139868,-0.00300866227105189,-0.00291045092902029,-0.00248001023912596,-0.00177728036180273,-0.000891758285101105,6.89299542049788e-05,0.000991786529164081,0.0017717278888134,0.002323368039096,0.00259015676865732,0.00255008337287879,0.00221722431780696,0.00163888196311656,0.0008891317626284,5.95954502500677e-05,-0.000751708980509443,-0.00145185835636715,-0.00196346329235916,-0.00223320360048813,-0.00223730600369586,-0.00198320672060528,-0.0015078638084413,-0.000872747008487381,-0.000155858570784707,0.000557717621125594,0.00118569521681716,0.00165836299799573,0.00192567735872109,0.00196288780089767,0.00177254099022061,0.00138325754054803,0.000845904987216462,0.000226711921565953,-0.000400335519520576,-0.000962701241549757,-0.00139736609628869,-0.00165803579080664,-0.00171970574928787,-0.00158109574001928,-0.00126409185458638,-0.000810594008541549,-0.000276891614679399,0.000273023483697537,0.000775160647471376,0.00117301099925146,0.00142381245758112,0.00150285423716837,0.00140608578670938,0.00114993003097963,0.000768636938308674,0.000309925098659387,-0.000170858511568497,-0.000617699814397936,-0.000980000669791717,-0.00121829539527311,-0.00130896250826477,-0.00124575052583585,-0.0010407725913145,-0.00072185926503934,-0.000329182452588241,8.96545119896399e-05,0.000485561185272115,0.000813408097499605,0.00103756803624229,0.00113521687389173,0.00109892191499811,0.000936820454864123,0.000671591932171266,0.000337009608367217,-2.61528950384784e-05,-0.000375193553360331,-0.000670098724295107,-0.000878556622664113,-0.000979254202799912,-0.000963940491934587,-0.000837779507490927,-0.000618936073285791,-0.000335564484666028,-2.23333158560568e-05,0.000283619227410963,0.000546994276474945,0.000739088050054782,0.000839803678684438,0.000840416605035771,0.000744245382470917,0.000565076157204841,0.000326618800056991,5.8123066197223e-05,-0.00020827459951958,-0.00044197643257179,-0.00061716451028695,-0.000715467386676795,-0.000728049123995096,-0.000656133594468835,-0.000510991700603516,-0.000311810336801547,-8.34137671209931e-05,0.000147088579956311,0.000352892317466653,0.000511029335745399,0.000604737676681199,0.000625715842075052,0.000573910995509865,0.000457687300648684,0.000292553425095262,9.96925566011924e-05,-9.80224997776918e-05,-0.000277689594458926,-0.000419046711998775,-0.000506816836567719,-0.000533546992961923,-0.000497392390926907,-0.000405283090212736,-0.000269962661070207,-0.000108171429910173,5.97803131827438e-05,0.000214866390354998,0.000339319686279749,0.000420288336147457,0.000449939117018485,0.000426818021236783,0.000355377628079852,0.000245526279748463,0.000111396113692465,-3.04980966966361e-05,-0.000163215644949003,-0.00027184139818119,-0.000344916076100867,-0.000375793059698525,-0.000362324346232173,-0.000307559078745625,-0.00021904244622581,-0.000109003398165533,8.75251444563616e-06,0.000120409041238688,0.000214560460906412,0.00028010756806309,0.000310044804600489,0.000302792134668104,0.000262914790039323,0.000192136240015363,0.00010372072882993,6.92795781244925e-06,-8.7039455873236e-05,-0.000166185286874397,-0.0002234669876132,-0.000252008085655159,-0.000250779114080171,-0.000220428423734313,-0.000166461462758403,-9.55598614554318e-05,-1.72321075387497e-05,5.96091116875056e-05,0.000125655124180849,0.000174122279439677,0.000199663295614572,0.000200547279514387,0.000177065802713278,0.000132809373413279,7.25526085169485e-05,2.79282614021521e-06,-7.07551353057681e-05,-0.00014297151143561,-0.000212003117801307,-0.000279332910949315,-0.000352698343712235,-0.000446803341385845,-0.000587439101948538,-0.000814566382769116,0.000974760608716798 ];
   
    
    
    % TEST COEFFS:(all 32)
    % test 1:
    % x_D = [0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55, 0.6,0.65, 0.7,0.75, 0.8,0.9,0.9,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.45,0.4,0.35,0.3,0.25,0.2,0.15,0.1]; 
    % test 2:
    % x_D = [0.8891890214379321, 0.9772298381076955, 0.5873416221481733, 0.15352291475107305, 0.3455388855837289, 0.5003711694330291, 0.2815307532088879, 0.1812902301545125, 0.10604523422422041, 0.8443776056901848, 0.15292789893593928, 0.3632770156387931, 0.2093324153756394, 0.0650295745605356, 0.8363469760786572, 0.9975945241488988, 0.6389162941222711, 0.6441625877038046, 0.2523024690618443, 0.32637917913351566, 0.6775512046437432, 0.3271295870095128, 0.6593859666105373, 0.9653782676284404, 0.18779446311503678, 0.04409664310187977, 0.17755553783528166, 0.6008246456496151, 0.8922373283847796, 0.17305816618553105, 0.18544919594895515, 0.32726722373913386];
    % test 3:
    % x_D = [0.7286672913732669, 0.561257844174795, 0.4129451398213989, 0.413668848945253, 0.9854229306718422, 0.35927392347578424, 0.15103113289416747, 0.4947837272738682, 0.4231859900083623, 0.5763100358116299, 0.23733402621883026, 0.14241235849270895, 0.4144434823426131, 0.5756614330196411, 0.25077380765936874, 0.31131765236709896, 0.8158298669804213, 0.3747622685003681, 0.7194743535299918, 0.3622639273028646, 0.9659789790895079, 0.21451865625935107, 0.040816083751576304, 0.35919105773619797, 0.8899214163176169, 0.006940637740977862, 0.12772180032025393, 0.6622801198053151, 0.400336497504755, 0.8752138505149384, 0.7825678828937692, 0.8673195878999808];
    
    
    
    % =========================================================================
    % ==============      QUANTIZE THE FILTER COEFFS     ====================== 
    % ============== RealRESIZE all of the filter coeffs ======================
    % =========================================================================
    
    for y = 1:length(x_D)
        sta.NYQ.coeff(y) = RealRESIZE(x_D(y), FixP_out,QType_out);
    end
    
    % =========================================================================
    % ==============          ACC, COUNTER INIT          ====================== 
    % =========================================================================
    
    % ACC: The number of multipliers = number of coefficients/oversampling ratio
    number_mult_D = length(sta.NYQ.coeff)/(sta.GLO.OSR_DO);
    
    % Instantiate the accumulators for each multiplier
    sta.NYQ.accumulate_D = zeros(1,number_mult_D);
    
    % Instantiate the enable flip flops, note that the number of ffs here is 
    % the number of multipliers - 1, this is because we have ffs between each
    % multiplier and we do not need one from the first multiplier and the
    % output.
    
    sta.NYQ.temp_D = zeros(1,number_mult_D - 1);
    
    
    % =========================================================================
    % ==============         INSTANTIATE STATE           ====================== 
    % ==============         COUNTER AND OUTPUT          ====================== 
    % =========================================================================
    % Indicates 1 whether new sample at output
    sta.NYQ.Valid_DO = 0; 
    
    % hold old input sample
    sta.NYQ.Sample_D = 0; 
    
    sta.NYQ.Cnt_D = 0;       % set counter to zero
    sta.NYQ.Out_DO = 0;      % old output
    
    sta.NYQ.inputs = [];      
    sta.NYQ.outputs = [];      
    
    % =========================================================================
    % ==============            RESIZE STATE             ====================== 
    % =========================================================================
    
    % resize using RealRESIZE
    
    sta.NYQ.Sample_D = RealRESIZE(sta.NYQ.Sample_D, FixP_out,QType_out);
    sta.NYQ.Valid_DO = RealRESIZE(sta.NYQ.Valid_DO, FixP_out,QType_out); 
    
    sta.NYQ.Cnt_D = RealRESIZE(sta.NYQ.Cnt_D, FixP_out,QType_out);
    sta.NYQ.Out_DO = RealRESIZE(sta.NYQ.Out_DO, FixP_out,QType_out);
    for i = 1:length(sta.NYQ.temp_D)
        sta.NYQ.temp_D(i) = RealRESIZE(sta.NYQ.temp_D(i), FixP_out,QType_out);
    end
    
    for i = 1:length(sta.NYQ.accumulate_D)
        sta.NYQ.accumulate_D(i) = RealRESIZE(sta.NYQ.accumulate_D(i),...
            FixP_out,QType_out);
    end
    
    % =========================================================================
    % ================         PERFORMANCE CHECKER          =================== 
    % =========================================================================
        
    % sta.NYQ.last_n = zeros(1, length(sta.NYQ.coeff));
    % sta.NYQ.S = [];
    % sta.NYQ.denom = zeros(1, length(sta.NYQ.coeff));
    % sta.NYQ.performance_checker = [];
    % for i = 1: length(sta.NYQ.coeff)
    %     sta.NYQ.denom(i) = 1;
    % end
    % sta.NYQ.filt_out = [];
    
end