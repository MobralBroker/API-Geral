package com.solinfbroker.apigeral.controller;

import com.solinfbroker.apigeral.model.CarteiraModel;
import com.solinfbroker.apigeral.repository.CarteiraRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
@ActiveProfiles("test")
class CarteiraControllerTest {
    @Mock
    CarteiraRepository carteiraRepository;
    @InjectMocks
    private CarteiraController carteiraController;
    @Test
    void listarCarteiras() {
        List<CarteiraModel> carteiraModelList = new ArrayList<>();
        when(carteiraRepository.findAll()).thenReturn(carteiraModelList);

        assertThat(carteiraController.listarCarteiras()).isNotNull();
    }

    @Test
    void listarCarteiraIdCliente() {
        List<CarteiraModel> carteiraModelList = new ArrayList<>();
        when(carteiraRepository.findByClienteId(1L)).thenReturn(carteiraModelList);
        assertThat(carteiraController.listarCarteiraIdCliente(1L)).isNotNull();
    }

    @Test
    void criarCarteira() {
        CarteiraModel carteiraModel = new CarteiraModel();
        when(carteiraRepository.save(carteiraModel)).thenReturn(carteiraModel);
        assertThat(carteiraController.criarCarteira(carteiraModel)).isNotNull();
    }
}