
package it.periale;

import it.periale.*;
import it.periale.beans.Ordini;
import java.util.ArrayList;
import static it.periale.TariffeCorriereDAO.calcolaTariffaMigliore;
import it.periale.beans.TariffeCorriere;
import javax.persistence.EntityManager;
import org.apache.wicket.extensions.markup.html.repeater.data.grid.ICellPopulator;
import org.apache.wicket.extensions.markup.html.repeater.data.table.AbstractColumn;
import org.apache.wicket.extensions.markup.html.repeater.data.table.DefaultDataTable;
import org.apache.wicket.extensions.markup.html.repeater.data.table.IColumn;
import org.apache.wicket.extensions.markup.html.repeater.data.table.PropertyColumn;
import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;
import org.apache.wicket.markup.repeater.Item;
import org.apache.wicket.model.IModel;
import org.apache.wicket.model.Model;

public class ElencoOrdini extends WebPage {
    
    public ElencoOrdini()
    {
        ArrayList<IColumn<Ordini, String>> colonne
                = new ArrayList<IColumn<Ordini, String>>();
        
        colonne.add(new PropertyColumn<Ordini, String>
            (Model.of("Numero d'ordine"),"numero"));
        colonne.add(new PropertyColumn<Ordini, String>
            (Model.of("Data"),"data"));
        /*colonne.add(new AbstractColumn<Ordini, String>
            (Model.of("Id ordine")) 
        {
            @Override
            public void populateItem(
                    Item<ICellPopulator<Ordini>> item, 
                    String wicketId, 
                    IModel<Ordini> imodel) 
            {
                Ordini o = imodel.getObject();
                Label l = new Label(wicketId,o.getId());
                item.add(l);
            }
        });*/
        colonne.add(new AbstractColumn<Ordini, String>
            (Model.of("Tariffa migliore")) 
        {
            @Override
            public void populateItem(
                    Item<ICellPopulator<Ordini>> item, 
                    String wicketId, 
                    IModel<Ordini> imodel) 
            {
                Ordini o = imodel.getObject();
                TariffeCorriere tariffa = calcolaTariffaMigliore(o);
                double costo = tariffa.getCosto();
                String corriere = tariffa.getNomeCorriere();
                String nomeTariffa = tariffa.getNomeTariffa();
                Label l = new Label(wicketId,"€ "+costo+" ("+corriere+" " +nomeTariffa+")");
                item.add(l);
            }
        });
        
          
        
        add(new DefaultDataTable<Ordini, String>(
            "ordini",colonne,
            new OrdiniDataProvider(),11));
        
        add(new MenuPanel("menu"));
    }
    
}
