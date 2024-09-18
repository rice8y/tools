function plotLDist(filename)
    df = readtable(filename);
    [label_counts, labels] = groupcounts(df.label);
    
    bar(label_counts);
    title('Label Distribution');
    xlabel('Label');
    ylabel('Count');
    set(gca, 'XTickLabel', labels);
    
    xtips = 1:length(label_counts);
    ytips = label_counts;
    text(xtips, ytips, string(label_counts), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
end
